const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var map = std.AutoHashMap(u8, i5).init(allocator);

    var iter = legacy.keyIterator();
    while (iter.next()) |k| {
        const v = legacy.get(k.*);
        for (v.?) |w| {
            try map.put(std.ascii.toLower(w), k.*);
        }
    }

    return map;
}
