type nucleotide = A | C | G | T

let rec calc_hamming_distance h1 h2 acc =
    let (x, tl1) = match h1 with
    | [] -> (None, [])
    | h :: tl -> (Some h, tl) in

    let (y, tl2) = match h2 with
    | [] -> (None, [])
    | h :: tl -> (Some h, tl) in

    if x = None then
        acc
    else if Some x = Some y then
        calc_hamming_distance tl1 tl2 acc
    else
        calc_hamming_distance tl1 tl2 (1+acc)



let hamming_distance h1 h2 =
    if List.length h1 != List.length h2 then
        Error "strands must be of equal length"
    else
        Ok (calc_hamming_distance h1 h2 0)
