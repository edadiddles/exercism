import gleam/regex.{Match}
import gleam/option.{Some}

pub fn is_valid_line(line: String) -> Bool {
    let assert Ok(re) = "\\[(ERROR|DEBUG|WARNING|INFO)\\]" |> regex.from_string
    
    re |> regex.check(line)
}

pub fn split_line(line: String) -> List(String) {
    let assert Ok(re) = "\\<[~\\*=-]*?\\>" |> regex.from_string

    re |> regex.split(line)
}

pub fn tag_with_user_name(line: String) -> String {
    let assert Ok(re) = "(?:User\\s+)(\\S+)" |> regex.from_string
    
    case re |> regex.scan(line) {
        [Match(submatches: [Some(user)], ..)] -> "[USER] " <> user <> " " <> line
        _ -> line
    }
}
