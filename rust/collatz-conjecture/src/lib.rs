pub fn collatz(n: u64) -> Option<u64> {
    if n <= 0 {
        return None
    }

    let mut val = n;

    let mut cnt = 0;
    while val != 1 {
        cnt += 1;
        if val%2 == 0 {
            val /= 2;
        } else {
            val = 3*val + 1;
        }
    }

    Some(cnt)
}
