def response(hey_bob):
    hey_bob = hey_bob.strip()
    if hey_bob == "":
        return "Fine. Be that way!"

    is_question = False
    is_yelling = False
    if hey_bob[-1] == "?":
        is_question = True
    if hey_bob.isupper():
        is_yelling = True

    if is_yelling and is_question:
        return "Calm down, I know what I'm doing!"
    elif is_question:
        return "Sure."
    elif is_yelling:
        return "Whoa, chill out!"
    else:
        return "Whatever."
