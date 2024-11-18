defmodule TakeANumber do
  def start() do
    spawn( fn -> 
      state = 0
      loop(state)
    end)
  end

  defp loop(state) do

    receive do
      {:report_state, sender_pid} -> loop( report_state(state, sender_pid) )
      {:take_a_number, sender_pid} -> loop( take_a_number(state, sender_pid) )
      :stop -> "stopping maching"
      _ -> loop(state) 
    end

  end

  defp report_state(state, pid) do
    send(pid, state)
    state
  end

  defp take_a_number(state, pid) do
    send(pid, state+1)
    state+1
  end
end
