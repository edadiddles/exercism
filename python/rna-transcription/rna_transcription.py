def to_rna(dna_strand):
    return dna_strand.replace("G", "X").replace("C", "G").replace("X", "C").replace("T", "Y").replace("A", "U").replace("Y", "A")
