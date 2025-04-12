pub fn brackets_are_balanced(string: &str) -> bool {
    let mut open_brackets = Vec::new();
    for c in string.chars().collect::<Vec<char>>() {
        let mut is_o_bracket = false;
        let mut is_c_bracket = false;

        if matches!(c, '[' | '{' | '(') {
            is_o_bracket=true;
        } else if matches!(c,  ']' | '}' | ')') {
            is_c_bracket=true;
        } else {
            continue;
        }

        if is_o_bracket {
            open_brackets.push(c);
        } else if is_c_bracket {
            if open_brackets.is_empty() {
                return false
            }

            let o_bracket = open_brackets.pop().unwrap();
            if o_bracket == '{' && c != '}' || 
                o_bracket == '[' && c != ']' || 
                    o_bracket == '(' && c != ')' {
                return false
            }
        }
    }

    open_brackets.is_empty()
}
