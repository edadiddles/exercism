pub fn nth(n: u32) -> u32 {
    let mut primes = vec![2,3,5,7,11,13,17,19,23,29,31,37];

    if (n as usize) < primes.len() {
        return primes[n as usize]
    }

    let mut k = primes.last().unwrap() + 1;
    while (n as usize) != primes.len()-1 {
        let mut is_prime = true;
        for i in 0..primes.len() {
            if k%primes[i] == 0 {
                is_prime = false;
                break;
            }
        }

        if is_prime {
            primes.push(k);
        }
        k += 1;
    }

    primes[n as usize]
}
