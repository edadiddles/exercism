#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist(first_list: &[i32], second_list: &[i32]) -> Comparison {

    if first_list.len() == 0 && second_list.len() == 0 {
        return Comparison::Equal
    }

    let mut matches = 0;
    for f in 0..first_list.len() {
        for s in 0..second_list.len() {
            if f+s >= first_list.len() {
                matches = 0;
                break;
            } else if second_list[s] == first_list[f+s] {
                matches += 1;
            } else {
                matches = 0;
                break;
            }
        }

        if matches == second_list.len() && first_list.len() == second_list.len() {
            return Comparison::Equal
        } else if matches == second_list.len() {
            return Comparison::Superlist
        }
    }


    matches = 0;
    for s in 0..second_list.len() {
        for f in 0..first_list.len() {
            if s+f >= second_list.len() {
                matches = 0;
                break;
            } else if first_list[f] == second_list[s+f] {
                matches +=1;
            } else {
                matches = 0;
                break;
            }
        }

        if matches == first_list.len() {
            return Comparison::Sublist
        }
    }



    Comparison::Unequal
}
