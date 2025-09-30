def square_root(number):
    lo = 0
    hi = 99999999999  # some large number

    q = 50  # initial guess
    while True:
        sq = q * q

        if sq == number:
            return q
        elif sq < number:
            lo = q + 1
        elif sq > number:
            hi = q
        else:
            assert("Something went wrong")

        q = (hi + lo) // 2

