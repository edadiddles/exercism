defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    get_bit_size(color_count, 0)    
  end

  defp get_bit_size(color_count, cnt) do
    if Integer.pow(2, cnt) >= color_count do
      cnt
    else
      get_bit_size(color_count, cnt+1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::size(2), 1::size(2), 2::size(2), 3::size(2)>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<head::size(bit_size), _rest::bitstring>> = picture
    head
  end

  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_head::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end 
