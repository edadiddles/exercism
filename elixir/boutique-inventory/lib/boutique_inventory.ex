defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory 
    |> Enum.sort(&(&1[:price] <= &2[:price]))
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.reduce([], fn item, acc -> 
      case item[:price] do
        nil -> acc ++ [Enum.into(item, %{})]
        _ -> acc
      end
    end)
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.reduce([], fn item, acc ->
      m = Enum.map(item, fn {k, v} ->
        case k do
          :name -> {k, v |> String.replace(old_word, new_word)}
          _ -> {k, v}
        end
      end)
      [Enum.into(m, %{}) | acc]
    end)
    |> Enum.reverse
  end

  def increase_quantity(item, count) do
    q = item
    |> Map.get(:quantity_by_size)
    |> Enum.map(fn {k, v} -> {k, v+count} end)
    |> Enum.into(%{})

    Map.put(item, :quantity_by_size, q)
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size)
    |> Enum.reduce(0, fn {_, v}, acc -> acc+v end)
  end
end
