defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    @planetary_classes |> Enum.random
  end

  def random_ship_registry_number() do
    "NCC-#{:rand.uniform(9000) + 1000}"
  end

  def random_stardate() do
    :rand.uniform * 1000 + 41000
  end

  def format_stardate(stardate) do
    case Kernel.is_float(stardate) do
      true -> "#{Kernel.round(:math.pow(10,1)*stardate)/:math.pow(10,1)}"
      false -> raise ArgumentError, message: "the argument value is invalid. expected float"
    end
  end
end
