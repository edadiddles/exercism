defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "stack underflow occurred, context: #{value}"}
      end
    end
  end

  def divide(stack) do
    {denom, r_stack} = List.pop_at(stack, 0, nil)
    {numer, _} = List.pop_at(r_stack, 0, nil)

    cond do
      denom == nil or numer == nil -> raise StackUnderflowError, "when dividing"
      denom == 0 -> raise DivisionByZeroError
      true -> numer/denom
    end
  end
end
