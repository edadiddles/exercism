def value(colors):
    sum = 0
    c = colors[0:2]
    c.reverse()
    for n, color in enumerate(c):
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

        sum += v * pow(10, n)

    return sum
