def is_armstrong_number(number):
    if number == 0:
        return True

    arr = []
    number_cpy = number
    while number_cpy / 10 > 0:
        arr.append(number_cpy % 10)
        number_cpy = number_cpy // 10

    print(arr)
    sum = 0
    for n in arr:
        sum += pow(n, len(arr))

    print(sum)
    return sum == number
