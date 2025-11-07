const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acronym: std.ArrayList(u8) = .empty;

    var isNewWord = true;
    for (words) |c| {
        if (isNewWord and std.ascii.isAlphabetic(c)) {
            try acronym.append(allocator, std.ascii.toUpper(c));
            isNewWord = false;
        }
        if (c == ' ' or c == '-') {
            isNewWord = true;
        }
    }

    return acronym.toOwnedSlice(allocator);
}
