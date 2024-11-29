defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  def generate(x) when not Kernel.is_integer(x) or x < 1, do: (raise ArgumentError, "count must be specified as an integer >= 1")
  def generate(1), do: [2]
  def generate(2), do: [2, 1]
  def generate(count) do
    [2 | Stream.iterate({2, 1}, fn {x, y} -> {y, x+y} end) |> Enum.take(count-1) |> Enum.map(fn {_, y} -> y end)]
  end
end
