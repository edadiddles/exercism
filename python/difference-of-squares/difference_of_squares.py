def square_of_sum(number):
    sum = 0
    for n in range(number+1):
        sum += n

    return pow(sum, 2)


def sum_of_squares(number):
    sum = 0
    for n in range(number+1):
        sum += pow(n, 2)

    return sum


def difference_of_squares(number):
    return square_of_sum(number) - sum_of_squares(number)
