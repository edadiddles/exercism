const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var n = num;
    var l: usize = 0;
    while (n > 0) {
        n /= 10;
        l += 1;
    }

    var sum: u128 = 0;
    n = num;
    while (n > 0) { 
        const k = n%10;
        var product: u128 = 1;
        for (0..l) |_| {
            product *= k;
        }
        sum += product;
        n /= 10;
    }

    return sum == num;
}
