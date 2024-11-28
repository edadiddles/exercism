defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    pid = spawn_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    receive do
      {:EXIT, r_pid, :normal} when r_pid == pid  -> Map.put(results, input, :ok)
      {:EXIT, r_pid, _} when r_pid == pid -> Map.put(results, input, :error)
    after
      100 -> Map.put(results, input, :timeout)
    end
    
  end

  def reliability_check(calculator, inputs) do
    orig_trap_exit = Process.flag(:trap_exit, true)
    reliability_checks = Enum.reduce(inputs, [], fn input, acc ->
      [start_reliability_check(calculator, input)] ++ acc
    end)

    results = Enum.reduce(reliability_checks, %{}, fn reliability_check, acc -> await_reliability_check_result(reliability_check, acc) end)
    Process.flag(:trap_exit, orig_trap_exit)
    results
  end

  def correctness_check(calculator, inputs) do
    orig_trap_exit = Process.flag(:trap_exit, true)
    tasks = Enum.reduce(inputs, [], fn input, acc ->
      [Task.async(fn -> calculator.(input) end)] ++ acc
    end)

    Enum.reduce(tasks, [], fn task, acc ->
      [Task.await(task, 100)] ++ acc
    end)
  end
end
