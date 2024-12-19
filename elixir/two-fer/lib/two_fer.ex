defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """


  @spec two_fer(String.t()) :: String.t()
  def two_fer(arg) when not is_binary(arg), do: raise(FunctionClauseError)
  def two_fer(name \\ "") do
      case name == "" do
        true -> "One for you, one for me."
        false -> "One for #{name}, one for me."
      end
  end

end
