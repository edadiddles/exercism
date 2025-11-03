const std = @import("std");


pub fn isIsogram(str: []const u8) bool {
    if (str.len == 0) {
        return true;
    }

    for (str[1..], 1..) |c, i| {
        for (str[0..i], 0..i) |k, _| {
            if (std.ascii.toLower(c) == std.ascii.toLower(k) and std.ascii.isAlphabetic(c)) {
                return false;
            }
        }
    }
    
    return true;
}
