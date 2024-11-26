# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{current_plot_id: 0, registered_plots: []} end, opts)
  end

  def list_registrations(pid) do 
    Agent.get(pid, fn community_garden -> community_garden.registered_plots |> Enum.filter(fn plot -> plot end) end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn community_garden->
        new_plot_id = community_garden.current_plot_id + 1

        new_plot = %Plot{plot_id: new_plot_id, registered_to: register_to} 
        {new_plot, %{current_plot_id: new_plot_id, registered_plots: [new_plot] ++ community_garden.registered_plots}}
      end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn community_garden ->
      rem_plots = Enum.filter(community_garden.registered_plots, fn plot -> plot.plot_id != plot_id end)
      {:ok, %{community_garden | registered_plots: rem_plots}}
    end)
  end

  def get_registration(pid, plot_id) do
    plot = list_registrations(pid) |> Enum.find(nil, fn p -> p.plot_id == plot_id end)
    case plot do
      %Plot{} -> plot
      _ -> {:not_found, "plot is unregistered"}
    end
  end
end
