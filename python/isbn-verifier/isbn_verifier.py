def is_valid(isbn):
    isbn = list(isbn.replace("-", ""))
    if len(isbn) != 10:
        return False

    sum = 0
    isbn.reverse()
    for n, d in enumerate(isbn):
        if n == 0 and d == "X":
            d = "10"

        if not d.isnumeric():
            return False

        print(f"{d} + {n+1}")
        sum += int(d)*(n+1)

    print(f"{sum}")
    return sum % 11 == 0
