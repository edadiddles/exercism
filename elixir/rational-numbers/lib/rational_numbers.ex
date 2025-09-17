defmodule RationalNumbers do
  import Kernel, except: [abs: 1]
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1,a2}, {b1,b2}) do
    {a1*b2+b1*a2,a2*b2} |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1,a2}, {b1,b2}) do
    {a1*b2-b1*a2,a2*b2} |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1,a2}, {b1,b2}) do
    {a1*b1,a2*b2} |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1,a2}, {b1,b2}) do
    {a1*b2,a2*b1} |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1,a2}) do
    cond do
      a1 < 0 -> abs({-a1,a2})
      a2 < 0 -> abs({a1,-a2})
      true -> {a1,a2} |> reduce
    end
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a1,a2}, n) do
    cond do
      n == 0 -> {1,1}
      n == 1 -> reduce({a1,a2})
      n < 0 -> pow_rational({a2,a1}, -n)
      n > 1 -> {Integer.pow(a1,n),Integer.pow(a2,n)} |> reduce
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a,b}) do
    {a0, b0} = {a,b} |> reduce
    cond do
      a0 == 0 -> 1.0
      a0 > 0 -> Float.pow(x/1,a0/b0)
      a0 < 0 -> Float.pow(1/x,-a0/b0)
    end
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a,b}) do
    cond do
      Integer.mod(a,13)==0 and Integer.mod(b,13)==0 -> reduce({div(a,13),div(b,13)})
      Integer.mod(a,7)==0 and Integer.mod(b,7)==0 -> reduce({div(a,7),div(b,7)})
      Integer.mod(a,5)==0 and Integer.mod(b,5)==0 -> reduce({div(a,5),div(b,5)})
      Integer.mod(a,3)==0 and Integer.mod(b,3)==0 -> reduce({div(a,3),div(b,3)})
      Integer.mod(a,2)==0 and Integer.mod(b,2)==0 -> reduce({div(a,2),div(b,2)})
      a < 0 and b < 0 -> {-a,-b}
      a > 0 and b < 0 -> {-a,-b}
      true -> {a,b}
    end
  end
end
