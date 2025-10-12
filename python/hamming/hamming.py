def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must be of equal length.")

    hamming_dist = 0
    for d in range(len(strand_a)):
        if strand_a[d] != strand_b[d]:
            hamming_dist += 1


    return hamming_dist
