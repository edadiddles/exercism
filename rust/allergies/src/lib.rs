pub struct Allergies {
    score: u32,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Self{ score }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        for allergy in self.allergies() {
            if *allergen == allergy {
                return true
            }
        }

        false
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        let mut b_allergens: Vec<u32> = Vec::new();

        let mut v = self.score;
        loop {
            b_allergens.push(v%2);
            v /= 2;
            if v == 0 {
                break;
            }
        }
        
        let mut allergens: Vec<Allergen> = Vec::new();
        for idx in 0..b_allergens.len() {
            if b_allergens[idx] != 1 {
                continue;
            }

            let allergen = match idx {
                0 => Allergen::Eggs,
                1 => Allergen::Peanuts,
                2 => Allergen::Shellfish,
                3 => Allergen::Strawberries,
                4 => Allergen::Tomatoes,
                5 => Allergen::Chocolate,
                6 => Allergen::Pollen,
                7 => Allergen::Cats,
                _ => break,
            };

            allergens.push(allergen);
        }

        allergens
    }
}
