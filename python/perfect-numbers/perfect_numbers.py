def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")

    factors = []
    for k in range(1, number):
        if number % k == 0:
            factors.append(k)

    s = sum(factors)
    category = "perfect"
    if s > number:
        category = "abundant"
    elif s < number:
        category = "deficient"

    return category
