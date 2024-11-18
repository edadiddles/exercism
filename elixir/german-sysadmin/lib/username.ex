defmodule Username do

  def sanitize([]), do: []
  def sanitize(username) do    
    [first | rest] = username

    case first do
      first when first >= ?a and first <= ?z -> [first | sanitize(rest)]
      # ä becomes ae
      228 -> ~c"ae" ++ sanitize(rest)
      # ö becomes oe
      246 -> ~c"oe" ++ sanitize(rest)
      # ü becomes ue
      252 -> ~c"ue" ++ sanitize(rest)
      # ß becomes ss
      223 -> ~c"ss" ++ sanitize(rest)
      # allow underscores
      ?_ -> [first | sanitize(rest)]
      _ -> sanitize(rest)
    end
    
  end
end
