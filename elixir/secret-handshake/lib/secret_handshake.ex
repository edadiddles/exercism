defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    r_commands(code, ["wink", "double blink", "close your eyes", "jump"], [])
  end

  def r_commands(code, [action | rem_actions], acc) do
    acc = case Integer.mod(code, 2) do
      1 -> acc ++ [action]
      0 -> acc
    end
    r_commands(Kernel.div(code,2), rem_actions, acc)
  end

  def r_commands(code, [], acc) do
    case Integer.mod(code, 2) do
      1 -> Enum.reverse(acc)
      0 -> acc
    end
  end
end
