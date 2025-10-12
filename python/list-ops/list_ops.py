def append(list1, list2):
    out = []
    if list1 is not None:
        for item in list1:
            out.append(item)
    if list2 is not None:
        for item in list2:
            out.append(item)

    return out


def concat(lists):
    out = []
    for list in lists:
        out.extend(list)

    return out


def filter(function, list):
    filtered = []
    for item in list:
        if function(item):
            filtered.append(item)

    return filtered


def length(list):
    l = 0
    for _ in list:
        l += 1

    return l


def map(function, list):
    out = []
    for item in list:
        out.append(function(item))

    return out


def foldl(function, list, initial):
    v = initial
    for item in list:
        v = function(v, item)

    return v


def foldr(function, list, initial):
    v = initial
    r_list = reverse(list)

    for item in r_list:
        v = function(v, item)

    return v


def reverse(list):
    n = length(list) - 1

    out = []
    while n >= 0:
        out.append(list[n])
        n -= 1

    return out
