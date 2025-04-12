pub fn plants(diagram: &'static str, student: &str) -> Vec<&'static str> {
    let idx = (u32::from(student.to_uppercase().chars().nth(0).unwrap()) - u32::from('A')) as usize;
    let n = diagram.chars().count()/2+1;
    let m = std::collections::hash_map::HashMap::from([
        ("G", "grass"),
        ("C", "clover"),
        ("R", "radishes"),
        ("V", "violets"),
    ]);

    let mut results = Vec::new();
    results.push(m.get(&diagram[2*idx..2*idx+1]).unwrap().chars().as_str());
    results.push(m.get(&diagram[2*idx+1..2*idx+2]).unwrap().chars().as_str());
    results.push(m.get(&diagram[n+2*idx..n+2*idx+1]).unwrap().chars().as_str());
    results.push(m.get(&diagram[n+2*idx+1..n+2*idx+2]).unwrap().chars().as_str());

    results
}
