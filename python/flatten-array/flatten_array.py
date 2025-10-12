def flatten(iterable):
    return r_flatten(iterable, [])


def r_flatten(iterable, acc):
    for iter in iterable:
        if iter is None:
            continue
        elif isinstance(iter, list):
            r_flatten(iter, acc)
            continue

        acc.append(iter)

    return acc
