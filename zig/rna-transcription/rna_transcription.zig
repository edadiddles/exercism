const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var buffer = try allocator.alloc(u8, dna.len);
 
    for (dna, 0..dna.len) |d, i| {
        if (d == 'G') {
            std.mem.copyForwards(u8, buffer[i..i+1], "C");
        } else if (d == 'C') {
            std.mem.copyForwards(u8, buffer[i..i+1], "G");
        } else if (d == 'T') {
            std.mem.copyForwards(u8, buffer[i..i+1], "A");
        } else if (d == 'A') {
            std.mem.copyForwards(u8, buffer[i..i+1], "U");
        }
    }
    
    return buffer[0..dna.len];
}
