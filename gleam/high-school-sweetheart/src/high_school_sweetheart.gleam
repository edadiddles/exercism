import gleam/string
import gleam/list

pub fn first_letter(name: String) {
    let assert Ok(letter) = name |> string.trim |> string.first
    letter
}

pub fn initial(name: String) {
    name |> first_letter |> string.uppercase |> string.append(".")
}

pub fn initials(full_name: String) {
    full_name 
        |> string.split(" ") 
        |> list.map(initial)
        |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
    "\n"
        |> string.append("     ******       ******\n")
        |> string.append("   **      **   **      **\n")
        |> string.append(" **         ** **         **\n")
        |> string.append("**            *            **\n")
        |> string.append("**                         **\n")
        |> string.append("**     A. A.  +  B. B.     **\n")
        |> string.append(" **                       **\n")
        |> string.append("   **                   **\n")
        |> string.append("     **               **\n")
        |> string.append("       **           **\n")
        |> string.append("         **       **\n")
        |> string.append("           **   **\n")
        |> string.append("             ***\n")
        |> string.append("              *\n")
        |> string.replace("A. A.", full_name1 |> initials)
        |> string.replace("B. B.", full_name2 |> initials)
}
