defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]\s[a-zA-Z\s]*/
  end

  def split_line(line) do
    line
      |> String.split(~r/\<[~=\*\-]*\>/)
  end

  def remove_artifacts(line) do
    line
      |> String.replace(~r/(end\-of\-line\d+)/i, "")
  end

  def tag_with_user_name(line) do
    cap_grp = ~r/(?:User\s+)([^\s]+)(?:\s?)/
      |> Regex.run(line, capture: :all_but_first)
      |> IO.inspect

    case cap_grp do
      nil -> line
      [user] -> "[USER] " <> user <> " " <> line
    end
  end
end
