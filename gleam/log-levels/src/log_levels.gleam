import gleam/string

pub fn message(log_line: String) -> String {
    let assert Ok(#(_, msg)) = string.split_once(log_line, " ")
    string.trim(msg)
}

pub fn log_level(log_line: String) -> String {
    case log_line {
        "[ERROR]" <> _ -> "error"
        "[INFO]" <> _ -> "info"
        "[WARNING]" <> _ -> "warning"
        _ -> ""
    }
}

pub fn reformat(log_line: String) -> String {
    let lvl = log_level(log_line)
    let msg = message(log_line)

    msg <> " (" <> lvl <> ")"
}
