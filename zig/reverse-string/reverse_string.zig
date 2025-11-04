const std = @import("std");

/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var idx: usize = 0;

    while (idx < s.len) {
        std.mem.copyForwards(u8, buffer[idx..idx+1], s[s.len-1-idx..s.len-idx]);
        idx += 1;
    }

    return buffer[0..idx];
}
