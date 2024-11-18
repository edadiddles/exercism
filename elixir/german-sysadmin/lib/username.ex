defmodule Username do

  def sanitize([]), do: []
  def sanitize(username) do    
    [first | rest] = username

    case first do
      # lower case letters a-z
      first when first >= 97 and first <= 122 -> [first] ++ sanitize(rest)
      # ä becomes ae
      228 -> ~c"ae" ++ sanitize(rest)
      # ö becomes oe
      246 -> ~c"oe" ++ sanitize(rest)
      # ü becomes ue
      252 -> ~c"ue" ++ sanitize(rest)
      # ß becomes ss
      223 -> ~c"ss" ++ sanitize(rest)
      # allow underscores
      95 -> [first] ++ sanitize(rest)
      _ -> [] ++ sanitize(rest)
    end
    
  end
end
