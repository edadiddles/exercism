pub fn eggCount(number: usize) usize {
    return r_eggCount(number, 0);
}

fn r_eggCount(number: usize, acc: usize) usize {
    if (number < 1) {
        return 0;
    } else if (number == 1) {
        return acc + 1;
    }

    const d_num: usize = number / 2;
    const r_num: usize = number % 2;
    return r_eggCount(d_num, acc + r_num);
}
