pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut vals: Vec<u32> = Vec::new();
    for i in 0..factors.len() {
        if factors[i] == 0 {
            continue;
        }
        let mut j = 1;
        while factors[i] * j < limit {
            let mul = factors[i] * j;
            if !vals.contains(&mul) {
                vals.push(mul);
            }
            j += 1;
        }
    }

    vals.iter().sum()
}
