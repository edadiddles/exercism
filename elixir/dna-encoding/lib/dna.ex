defmodule DNA do
  def encode_nucleotide(code_point) when code_point == ?\s, do: 0
  def encode_nucleotide(code_point) when code_point == ?A, do: 1
  def encode_nucleotide(code_point) when code_point == ?C, do: 2
  def encode_nucleotide(code_point) when code_point == ?G, do: 4
  def encode_nucleotide(code_point) when code_point == ?T, do: 8

  def decode_nucleotide(encoded_code) when encoded_code == 0b0000, do: ?\s
  def decode_nucleotide(encoded_code) when encoded_code == 0b0001, do: ?A
  def decode_nucleotide(encoded_code) when encoded_code == 0b0010, do: ?C
  def decode_nucleotide(encoded_code) when encoded_code == 0b0100, do: ?G
  def decode_nucleotide(encoded_code) when encoded_code == 0b1000, do: ?T

  def encode(dna), do: do_encode(dna, <<>>)
  defp do_encode([], acc), do: acc
  defp do_encode([head | tail], acc) do
    n = <<encode_nucleotide(head)::4>>
    do_encode(tail, <<acc::bitstring, n::bitstring>>)
  end

  def decode(dna), do: do_decode(dna, ~c"")
  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<head::4, tail::bitstring>>, acc) do
    n = decode_nucleotide(head)
    do_decode(tail, acc ++ [n])
  end
end
