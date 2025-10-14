def resistor_label(colors):
    band_values = {
            "black": (0, ""),
            "brown": (1, "1"),
            "red": (2, "2"),
            "orange": (3, ""),
            "yellow": (4, ""),
            "green": (5, "0.5"),
            "blue": (6, "0.25"),
            "violet": (7, "0.1"),
            "grey": (8, "0.05"),
            "white": (9, ""),
            "gold": (-1, "5"),
            "silver": (-1, "10")
        }

    val = ""
    for color in colors[:-2]:
        val += str(band_values[color][0])

    if val == "":
        return "0 ohms"

    val += "0" * band_values[colors[-2]][0]

    order = 0
    while (k := float(val)/1000) >= 1:
        val = str(k)
        order += 1

    units = ""
    if order == 1:
        units += "kilo"
    elif order == 2:
        units += "mega"

    units += "ohms"

    tolerance = f"±{band_values[colors[-1]][1]}%" if len(band_values[colors[-1]][1]) > 0 else ""

    return f"{val} {units} {tolerance}".replace(".0 ", " ")
