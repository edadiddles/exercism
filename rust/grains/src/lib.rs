pub fn square(s: u32) -> u64 {
    (2 as u64).pow(s-1)
}

pub fn total() -> u64 {
    let mut sum = 0;
    for s in 1..=64 {
        sum += square(s);
    }

    sum
}
