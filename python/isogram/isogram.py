def is_isogram(string):
    letters = list(map(lambda x: x.lower(), filter(lambda x: x.isalpha(), string)))
    return len(letters) == len(set(letters))
