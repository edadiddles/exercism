defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
      |> String.split([" ", "-", "_"])
      |> Enum.filter(fn s -> s != "" end)
      |> Enum.reduce("", fn w, acc -> acc <> String.first(w) end)
      |> String.upcase
  end
end
