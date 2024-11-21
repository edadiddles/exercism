defmodule BasketballWebsite do
  def extract_from_path(data, ""), do: data
  def extract_from_path(data, path) do
    [k | tail] = String.split(path, ".", [parts: 2])
    extract_from_path(data[k], List.last(tail, ""))
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
