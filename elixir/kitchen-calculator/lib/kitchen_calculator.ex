defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, vol} = volume_pair
    vol
  end

  def to_milliliter(volume_pair) do
    {u, v} = volume_pair
    {:milliliter, v * get_conversion(u)}
  end

  def from_milliliter(volume_pair, unit) do
    {_, v} = volume_pair
    {unit, v/get_conversion(unit)}
  end

  def convert(volume_pair, unit) do
    v_pair = to_milliliter(volume_pair)
    from_milliliter(v_pair, unit)
  end

  defp get_conversion(unit) do
    case unit do
      :cup -> 240
      :fluid_ounce -> 30
      :teaspoon -> 5
      :tablespoon -> 15
      :milliliter -> 1
    end
  end
end
