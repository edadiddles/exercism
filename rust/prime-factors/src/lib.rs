pub fn factors(n: u64) -> Vec<u64> {
    let mut known_primes = vec![2,3,5,7,11,13,17,19,23,29,31,37];

    let mut factors = Vec::new();
    let mut val = n;
    while val > 1 {
        let mut idx = 0;
        while idx < known_primes.len() {
            let p = known_primes[idx];
            if p > val {
                break;
            }

            if val%p == 0 {
                factors.push(p);
                val /= p;
                idx = 0;
                continue;
            }
            idx += 1;
        }

        let last_kp = known_primes.last().unwrap();
        for k in last_kp+1..=val/2 {
            if val%k == 0 {
                factors.push(k);
                val /= k;
                known_primes.push(k);
                break;
            } else if k == val/2 {
                factors.push(val);
                val /= val;
                known_primes.push(k);
                break;
            }
        }
    }

    factors
}
