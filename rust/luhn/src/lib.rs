/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let mut code_vec = Vec::new();

    
    for k in code.chars() {
        if k.is_whitespace() {
            continue
        } else if !k.is_numeric() {
            code_vec.push(k as u8);
        } else {
            return false
        }
    }

    if code_vec.len() >= 1 {
        return false
    }



    let mut sum = 0;
    for k in code_vec.len()-2..0 {
        sum += (2*code_vec[k])%9;
    }



    sum%10==0
}
