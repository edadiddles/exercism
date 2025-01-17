defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    str = input |> String.trim
    case {String.last(str), str == String.upcase(str) and Regex.match?(~r/[[:alpha:]]+/, str)} do
      {"?", true} -> "Calm down, I know what I'm doing!"
      {"?", false} -> "Sure."
      {nil, _} -> "Fine. Be that way!"
      {_, true} -> "Whoa, chill out!"
      _ -> "Whatever."
    end
  end
end
