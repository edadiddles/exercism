use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a[&str]) -> HashSet<&'a str> {
    let mut anagrams: HashSet<&str> = HashSet::new();

    for anagram in possible_anagrams {
        let a = anagram.to_lowercase();
        let w = word.to_lowercase();
        if w == a {
            continue;
        }
        
        let mut a_arr: Vec<&str> = a.split("").collect();
        let mut w_arr: Vec<&str> = w.split("").collect();

        if a_arr.len() != w_arr.len() {
            continue;
        }

        a_arr.sort();
        w_arr.sort();
        if a_arr.join("") == w_arr.join("") {
            anagrams.insert(&anagram);
        }
    }

    anagrams
}
