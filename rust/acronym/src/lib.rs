pub fn abbreviate(phrase: &str) -> String {
    let words = phrase.split([' ', '-', '_']);

    let mut acronym = Vec::new();
    for word in words {
        let mut chars = word.chars();
        let c = chars.next();
        if c.is_some() {
            acronym.push(c.unwrap().to_string().to_uppercase());
        }

        if word.to_string() != word.to_lowercase() && word.to_string() != word.to_uppercase(){
            for k in chars {
                if k.is_uppercase() {
                    acronym.push(k.to_string());
                }
            }
        }

    }

    acronym.join("")
}
