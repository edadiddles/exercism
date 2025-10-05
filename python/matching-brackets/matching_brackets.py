def is_paired(input_string):
    if input_string == "":
        return True

    pairs = {
        "{": "}",
        "[": "]",
        "(": ")"
    }

    brace_arr = []
    for c in input_string:
        if c in pairs:
            brace_arr.append(c)
        elif c in pairs.values():
            if len(brace_arr) == 0:
                return False
            elif pairs.get(brace_arr[-1], "") != c:
                return False

            brace_arr.pop()

    return len(brace_arr) == 0
