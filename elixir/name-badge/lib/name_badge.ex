defmodule NameBadge do
  def print(id, name, department) do 
    print_id(id)
    |> Kernel.<>(name)
    |> Kernel.<>(" - ")
    |> Kernel.<>(print_department(department))

  end

  defp print_id(id) do
    if id, do: "[#{id}] - ", else: ""
  end

  defp print_department(department) do
    if department, do: String.upcase(department), else: "OWNER"
  end
end
