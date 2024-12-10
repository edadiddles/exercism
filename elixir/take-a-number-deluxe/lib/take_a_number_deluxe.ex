defmodule TakeANumberDeluxe do
  use GenServer
  # Client API

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    GenServer.call(machine, :report_state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(machine, :queue_number)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve_next_number, priority_number})
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.call(machine, :reset_state)
  end

  # Server callbacks
  @impl GenServer
  def init(init_arg) do
    min = Keyword.get(init_arg, :min_number)
    max = Keyword.get(init_arg, :max_number)
    timeout = Keyword.get(init_arg, :auto_shutdown_timeout, :infinity)
    {code, msg} = TakeANumberDeluxe.State.new(min, max, timeout)
    case code do
      :error -> {code, msg}
      _ -> {code, msg, timeout}
    end
  end

  @impl GenServer
  def handle_call(:report_state, _from, state) do
    timeout = Map.get(state, :auto_shutdown_timeout)
    {:reply, state, state, timeout}
  end

  @impl GenServer
  def handle_call(:queue_number, _from, state) do
    resp = TakeANumberDeluxe.State.queue_new_number(state)
    timeout = Map.get(state, :auto_shutdown_timeout)
    case resp do
      {code, next_nbr, new_state} -> {:reply, {code, next_nbr}, new_state, timeout}
      {code, msg} -> {:reply, {code, msg}, state, timeout}
    end
  end

  @impl GenServer
  def handle_call({:serve_next_number, priority_number}, _from, state) do
    resp = TakeANumberDeluxe.State.serve_next_queued_number(state, priority_number)
    timeout = Map.get(state, :auto_shutdown_timeout)
    case resp do
      {code, next_nbr, new_state} -> {:reply, {code, next_nbr}, new_state, timeout}
      {code, msg} -> {:reply, {code, msg}, state, timeout}
    end
  end

  @impl GenServer
  def handle_call(:reset_state, _from, %{min_number: min, max_number: max, auto_shutdown_timeout: timeout}) do
    {code, state} = TakeANumberDeluxe.State.new(min, max, timeout)
    timeout = Map.get(state, :auto_shutdown_timeout)
    {:reply, code, state, timeout}
  end

  @impl GenServer
  def handle_info(:timeout, state), do: {:stop, :normal, state}

  @impl GenServer
  def handle_info(msg, state) do
    timeout = Map.get(state, :auto_shutdown_timeout)
    {:noreply, state, timeout}
  end
    
end
