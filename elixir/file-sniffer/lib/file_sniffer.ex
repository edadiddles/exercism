defmodule FileSniffer do
  
  
  def type_from_extension(extension) when extension=="exe", do: "application/octet-stream"
  def type_from_extension(extension) when extension=="bmp", do: "image/bmp"
  def type_from_extension(extension) when extension=="png", do: "image/png"
  def type_from_extension(extension) when extension=="jpg", do: "image/jpg"
  def type_from_extension(extension) when extension=="gif", do: "image/gif"
  def type_from_extension(_), do: nil

  def type_from_binary(file_binary) do
    type_from_binary_acc(file_binary, <<>>)
  end
  
  defp type_from_binary_acc(<<>>, _), do: nil
  defp type_from_binary_acc(<<head, tail::binary>>, acc) do
  
    case acc do
      <<0x7f,0x45,0x4c,0x46>> -> "application/octet-stream"
      <<0x42,0x4d>> -> "image/bmp"
      <<0x89,0x50,0x4e,0x47,0x0d,0x0a,0x1a,0x0a>> -> "image/png"
      <<0xff,0xd8,0xff>> -> "image/jpg"
      <<0x47,0x49,0x46>> -> "image/gif"
      _ -> type_from_binary_acc(tail, acc<><<head>>)
    end
  end
  defp type_from_binary_acc(<<_, _::bitstring>>, _), do: nil 

  def verify(file_binary, extension) do
    t_ext = type_from_extension(extension) 
    t_bin = type_from_binary(file_binary)
    case t_ext == t_bin and t_ext != nil do
      true -> {:ok, t_ext}
      false -> {:error, "Warning, file format and file extension do not match."}
    end
  end
end
