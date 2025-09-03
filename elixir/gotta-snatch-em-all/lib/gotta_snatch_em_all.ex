defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    MapSet.new([card])
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    {MapSet.member?(collection, card), MapSet.put(collection, card)}
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    {MapSet.member?(collection, your_card) and not MapSet.member?(collection, their_card), MapSet.difference(collection, MapSet.new([your_card])) |> MapSet.put(their_card)}
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    cards |> MapSet.new |> MapSet.to_list |> Enum.sort
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    your_collection |> MapSet.difference(their_collection) |> MapSet.size
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards([collection | last]) do
    last |> boring_cards(collection)
  end
  defp boring_cards([collection | last], accumulator) do
    last |> boring_cards(accumulator |> MapSet.intersection(collection))
  end
  defp boring_cards([collection], accumulator) do
    accumulator |> MapSet.intersection(collection)
  end
  defp boring_cards([], accumulator) do
    accumulator |> MapSet.to_list
  end
  def boring_cards([]) do
    []
  end


  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards([collection | last]) do
    last |> total_cards(collection) 
  end
  defp total_cards([collection | last], accumulator) do
    last |> total_cards(accumulator |> MapSet.union(collection))
  end
  defp total_cards([], accumulator) do
    accumulator |> MapSet.to_list |> Kernel.length
  end
  def total_cards([]) do
    0
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    collection |> MapSet.split_with(fn str -> str |> String.contains?("Shiny") end) |> convert_to_lists
  end
  defp convert_to_lists({a, b}) do
    {a |> MapSet.to_list, b |> MapSet.to_list}
  end
end
