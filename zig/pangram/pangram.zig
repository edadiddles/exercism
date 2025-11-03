const std = @import("std");


pub fn isPangram(str: []const u8) bool {
    var letters = [_]u8{0} ** 26;

    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) {
            continue;
        }
        
        const idx = std.ascii.toLower(c) - 'a';
        letters[idx] += 1;
    }

    for (letters) |cnt| {
        if (cnt == 0) {
            return false;
        }
    }

    return true;
}
