pub fn annotate(minefield: &[&str]) -> Vec<String> {
    let mut output: Vec<String> = Vec::new();
    for r in 0..minefield.len() {
        let mut row_vals = String::new();
        for c in 0..minefield[r].len() {
            let mut cnt = 0;
            let mut is_mine = false;
            // prev row 
            if r > 0 && c > 0 && minefield[r-1][c-1..c] == *"*" {
                cnt += 1;
            }
            if r > 0 && minefield[r-1][c..c+1] == *"*" {
                cnt += 1;
            }
            if r > 0 && c+1 < minefield[r-1].len() && minefield[r-1][c+1..c+2] == *"*" {
                cnt += 1;
            }
            //curr row
            if c > 0 && minefield[r][c-1..c] == *"*" {
                cnt += 1;
            }
            if minefield[r][c..c+1] == *"*" {
                is_mine = true;
            }
            if c+1 < minefield[r].len() && minefield[r][c+1..c+2] == *"*" {
                cnt += 1;
            }
            //next row
            if r+1 < minefield.len() && c > 0 && minefield[r+1][c-1..c] == *"*" {
                cnt += 1;
            }
            if r+1 < minefield.len() &&  minefield[r+1][c..c+1] == *"*" {
                cnt += 1;
            }
            if r+1 < minefield.len() && c+1 < minefield[r+1].len() && minefield[r+1][c+1..c+2] == *"*" {
                cnt += 1;
            }


            if is_mine {
                row_vals.push_str("*");
            } else if cnt == 0 {
                row_vals.push_str(" ");
            } else {
                row_vals.push_str(&cnt.to_string());
            }
        }

        output.push(row_vals);
    }

    output
}
