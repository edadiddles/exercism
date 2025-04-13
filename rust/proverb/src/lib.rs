pub fn build_proverb(list: &[&str]) -> String {
    let mut proverb = String::new();
    if list.is_empty() {
        return proverb
    }

    for i in 1..list.len() {
        let prev = list[i-1];
        let curr = list[i];
        proverb = format!("{proverb}For want of a {prev} the {curr} was lost.\n")
    }

    let first = list[0];
    proverb = format!("{proverb}And all for the want of a {first}.");

    proverb
}
