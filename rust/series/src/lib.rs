pub fn series(digits: &str, len: usize) -> Vec<String> {
    let mut results: Vec<String> = Vec::new();

    if len == 0 {
        return results
    } else if len > digits.len() {
        return results
    } else if len == digits.len() {
        results.push(digits.to_string());
        return results
    }

    let series_length = digits.len() - len;
    for i in 0..=series_length {
        results.push(digits[i..i+len].to_string()); 
    }

    results
}
