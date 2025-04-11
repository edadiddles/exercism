pub fn reply(message: &str) -> &str {
    let m = message.trim();
    if m == "" {
        return "Fine. Be that way!"
    }

    let mut is_question = false;
    if m.ends_with('?') {
        is_question = true
    }

    let mut is_yell = false;
    if m.chars().any(|c| c.is_alphabetic()) && m == message.to_uppercase() {
        is_yell = true
    }

    if is_question && is_yell {
        return "Calm down, I know what I'm doing!"
    } else if is_question {
        return "Sure."
    } else if is_yell {
        return "Whoa, chill out!"
    }


    "Whatever."
}
