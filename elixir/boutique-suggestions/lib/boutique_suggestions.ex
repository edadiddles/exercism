defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = options |> Keyword.get(:maximum_price, 100.0)
    for top <- tops, 
        bottom <- bottoms, 
        top.base_color != bottom.base_color and top.price + bottom.price <= max_price do
      {top,bottom}
    end
  end
end
