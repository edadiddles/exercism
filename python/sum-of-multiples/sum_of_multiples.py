def sum_of_multiples(limit, multiples):
    uniq_multiples = set()
    for m in multiples:
        if m == 0:
            uniq_multiples.add(0)
            continue

        k = 0
        while m*k < limit:
            uniq_multiples.add(m*k)
            k += 1

    return sum(uniq_multiples)
