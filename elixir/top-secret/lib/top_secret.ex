defmodule TopSecret do
  def to_ast(string) do
    {_, ast} = Code.string_to_quoted(string)
    ast
  end

  def decode_secret_message_part(ast, acc) do
    case ast do
      {:def, _, [{:when, _, [{fun, _, inputs} | _]} | _]} -> {ast, [Macro.to_string(quote do: unquote(fun)()) |> String.replace("()", "") |> String.slice(0, inputs_length(inputs)) | acc]}
      {:defp, _, [{:when, _, [{fun, _, inputs} | _]} | _]} -> {ast, [Macro.to_string(quote do: unquote(fun)()) |> String.replace("()", "") |> String.slice(0, inputs_length(inputs)) | acc]}
      {:def, _, [{fun, _, inputs} | _]}  -> {ast, [Macro.to_string(quote do: unquote(fun)()) |> String.replace("()", "") |> String.slice(0, inputs_length(inputs)) | acc]}
      {:defp, _, [{fun, _, inputs} | _]} -> {ast, [Macro.to_string(quote do: unquote(fun)()) |> String.replace("()", "") |> String.slice(0, inputs_length(inputs)) | acc]}
      _ -> {ast, acc}
    end
  end

  def decode_secret_message(string) do
    ast = to_ast(string)
    {_, msg} = Macro.prewalk(ast, [], fn part, acc ->
        decode_secret_message_part(part, acc)
      end)

    msg |> Enum.reverse |> Enum.join("") 

  end

  defp inputs_length(inputs) do
    case inputs do
      nil -> 0
      _ -> Kernel.length(inputs)
    end
  end
end
