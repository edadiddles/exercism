defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(dot, frame_number, opts) :: dot

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, _) do
    cond do
      :math.fmod(frame_number, 4) == 0 -> %{dot | opacity: Map.fetch!(dot, :opacity)/2}
      true -> dot
    end
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init(opts) do
    velocity = Keyword.get(opts, :velocity, nil)
    cond do
      velocity == nil -> {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
      not Kernel.is_number(velocity) -> {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
      true -> {:ok, opts}
    end
  end

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, opts) do
    velocity = Keyword.get(opts, :velocity)
    %{dot | radius: Map.fetch!(dot, :radius)+((frame_number-1)*velocity)}
  end
end
