def reverse(text):
    char_arr = []
    for c in text:
        char_arr.insert(0, c)

    return "".join(char_arr)
