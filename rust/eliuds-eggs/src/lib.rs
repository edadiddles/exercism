pub fn egg_count(display_value: u32) -> usize {
    let mut sum = display_value%2;
   
    let mut val = display_value/2;
    while val > 0 {
        sum += val%2;
        val = val/2;
    }

    sum as usize
}
