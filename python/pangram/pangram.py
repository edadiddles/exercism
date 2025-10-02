def is_pangram(sentence):
    return len(set(map(lambda y: y.lower(), filter(lambda x: x.isalpha(), list(sentence))))) == 26
