pub fn is_armstrong_number(num: u32) -> bool {
    let mut d = num;
    let mut digits: Vec<u32> = Vec::new();
    

    
    loop {
        digits.push(d%10);
        d = d/10;
        if d == 0 {
            break;
        }
    }

    let n: u32 = digits.len().try_into().unwrap();

    let mut k = 0;
    for v in digits {
        k += v.pow(n);
    }

    return k == num
}
