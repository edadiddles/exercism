def rotate(text, key):
    cipher_text = ""
    for c in text:
        if not c.isalpha():
            cipher_text += c
            continue
        ascii_offset = ord(c.lower()) + key - 97
        k = chr(97 + (ascii_offset % 26))
        if c.isupper():
            cipher_text += k.upper()
        else:
            cipher_text += k.lower()

    return cipher_text
