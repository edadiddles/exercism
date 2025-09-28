def equilateral(sides):
    if not is_valid(sides):
        return False

    return sides[0] == sides[1] and sides[1] == sides[2]


def isosceles(sides):
    if not is_valid(sides):
        return False

    return sides[0] == sides[1] or sides[0] == sides[2] or sides[1] == sides[2]


def scalene(sides):
    if not is_valid(sides):
        return False

    return sides[0] != sides[1] and sides[0] != sides[2] and sides[1] != sides[2]


def is_valid(sides):
    if 0 in sides:
        return False

    [a, b, c] = sides
    return (a+b) >= c and (b+c) >= a and (a+c) >= b
