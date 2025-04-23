/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let mut code_vec = Vec::new();
    for k in code.chars() {
        if k.is_whitespace() {
            continue
        } else if k.is_numeric() {
            code_vec.push(k.to_digit(10).unwrap());
        } else {
            return false
        }
    }

    if code_vec.len() <= 1 {
        return false
    }

    let mut k = code_vec.len()-2;
    loop {
        code_vec[k] = 2*code_vec[k];
        if code_vec[k] > 9 {
            code_vec[k] -= 9;
        }
        if k <= 1 {
            break
        }
        k -= 2;
    }

    let mut sum = 0;
    for c in 0..code_vec.len() {
        println!("c: {}", code_vec[c]);
        sum += code_vec[c];
    }

    println!("sum: {sum}");
    sum%10==0
}
