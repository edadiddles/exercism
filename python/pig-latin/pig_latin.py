def translate(text):
    if (text := text.strip()) == "":
        return text

    vowels = ["a", "e", "i", "o", "u"]

    full_translated = []
    words = text.split(" ")

    for word in words:
        translated = ""
        if word[0] in vowels or (len(word) > 1 and word[0:2] in ["xr", "yt"]):
            translated += word
        else:
            rules = []
            k = word.find("qu")
            if k >= 0:
                rules.append({"idx": k, "value": word[2+k:] + word[0:2+k]})

            v_arr = sorted([word.find(vowel) for vowel in vowels])
            for v in v_arr:
                if v > -1:
                    rules.append({"idx": v, "value": word[v:] + word[0:v]})
                    break

            y = word.find("y")
            if y > 0:
                rules.append({"idx": y, "value": word[y:] + word[0:y]})

            translated += sorted(rules, key=lambda r: r["idx"])[0]["value"]

        translated += "ay"
        full_translated.append(translated)

    return " ".join(full_translated)
