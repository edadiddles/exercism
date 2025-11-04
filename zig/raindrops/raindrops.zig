const std = @import("std");


pub fn convert(buffer: []u8, n: u32) []const u8 {
    var idx: usize = 0;
    const buf_ptr: [*]u8 = buffer.ptr;
    
    if (n%3 == 0) {
        @memcpy(buf_ptr + idx, "Pling\x00");
        idx += 5;
    } 
    if (n%5 == 0) {
        @memcpy(buf_ptr + idx, "Plang\x00");
        idx += 5;
    }
    if (n%7 == 0) {
        @memcpy(buf_ptr + idx, "Plong\x00");
        idx += 5;
    }

    if (idx == 0) {
        return std.fmt.bufPrint(buffer[idx..buffer.len], "{d}", .{n}) catch { unreachable; };
    }

    return buffer[0..idx];
}
