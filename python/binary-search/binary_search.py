def find(search_list, value):
    lo = 0
    hi = len(search_list)-1

    while lo <= hi:
        k = (hi + lo) // 2
        if search_list[k] == value:
            return k
        elif search_list[k] > value:
            hi = k-1
        elif search_list[k] < value:
            lo = k+1

    raise ValueError("value not in array")
