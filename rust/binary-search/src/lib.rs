pub fn find(array: &[i32], key: i32) -> Option<usize> {
    let mut low: i8 = 0;
    let mut high: i8 = array.len() as i8 -1;
     
    while low <= high {
        let idx = low + (high - low)/2;

        if array[idx as usize] == key {
            return Some(idx as usize);
        } else if array[idx as usize] > key {
            high = idx-1;
        } else if array[idx as usize] < key {
            low = idx+1;
        }
    }

    None
}

