def label(colors):
    colors = colors[0:3]

    resistance = ""
    for color in colors[0:2]:
        val = get_band_value(color)
        if resistance != "" or val > 0:
            resistance += str(val)

    if resistance == "":
        resistance = "0"

    o = get_band_value(colors[-1])
    print(o)
    resistance += "0"*o

    n = 0
    while resistance[-3:].endswith("000"):
        resistance = resistance[0:-3]
        n += 1

    modifiers = [" ", " kilo", " mega", " giga"]

    units = modifiers[n]+"ohms"
    return resistance + units


def get_band_value(color):
    v = 0
    match color:
        case "black":
            v = 0
        case "brown":
            v = 1
        case "red":
            v = 2
        case "orange":
            v = 3
        case "yellow":
            v = 4
        case "green":
            v = 5
        case "blue":
            v = 6
        case "violet":
            v = 7
        case "grey":
            v = 8
        case "white":
            v = 9

    return v
