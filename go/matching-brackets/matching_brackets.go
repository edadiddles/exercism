package brackets

func Bracket(input string) bool {
    brack_stack := make([]byte, 0)
    is_unbalanced := false
    var brack byte
    for i:=0; i < len(input); i++ {
        curr_inpt := input[i]
        if chk_bracket_open(curr_inpt) {
            brack_stack = append(brack_stack, input[i])
        } else if chk_bracket_closed(curr_inpt) {
            brack, brack_stack = pop_stack(brack_stack)
            if !chk_bracket_matched(brack, input[i]) {
                is_unbalanced = true
                break
            }
        }
    }

    if len(brack_stack) > 0 {
        is_unbalanced = true
    }

    return !is_unbalanced
}

func pop_stack(stack []byte) (byte, []byte) {
    if len(stack) == 0 {
        return '~', nil
    }
    v := stack[len(stack)-1]
    stack = stack[:len(stack)-1]
    return v, stack
     
}


func chk_bracket_open(input byte) bool {
    return input == '{' || input == '[' || input == '('
}

func chk_bracket_closed(input byte) bool {
    return input == '}' || input == ']' || input == ')'
}

func chk_bracket_matched(input_open byte, input_closed byte) bool {
    if input_open == '[' && input_closed == ']' {
        return true
    } else if input_open == '{' && input_closed == '}' {
        return true
    } else if input_open == '(' && input_closed == ')' {
        return true
    }

    return false
}
