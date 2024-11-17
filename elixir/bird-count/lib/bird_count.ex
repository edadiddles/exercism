defmodule BirdCount do
  def today([]), do: nil 
  def today(list) do
    [head | _] = list
    head
  end

  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
    [head | tail] = list
    [head+1 | tail]
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total([]), do: 0
  def total(list) do
    [head | tail] = list
    head + total(tail)
  end

  def busy_days([]), do: 0
  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)
  def busy_days([head | tail]) when head < 5, do: busy_days(tail)
end
