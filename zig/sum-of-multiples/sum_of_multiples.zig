const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var multiples = try allocator.alloc(u8, limit);
    defer allocator.free(multiples);

    var energy_points: u64 = 0;
    for (factors) |f| {
        if (f == 0) { continue; }
        var k = f;
        while (k < limit) { 
            if (multiples[k-1] != 1) {
                energy_points += k;
                multiples[k-1] = 1;
            }
            k += f;
        }
    }

    return energy_points;
}
