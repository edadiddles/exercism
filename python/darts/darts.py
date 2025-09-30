def score(x, y):
    s = 0
    if x*x + y*y <= 1:
        s = 10
    elif x*x + y*y <= 25:
        s = 5
    elif x*x + y*y <= 100:
        s = 1

    return s
