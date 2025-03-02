defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.trim |> String.first
  end

  def initial(name) do
    name |> first_letter |> String.upcase |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first, last] = full_name |> String.split
    first_initial = first |> initial
    last_initial = last |> initial
    first_initial <> " " <> last_initial
  end

  def pair(full_name1, full_name2) do
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *
    i1 = initials(full_name1)
    i2 = initials(full_name2)
    
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
