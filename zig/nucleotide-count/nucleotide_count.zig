pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var cnts: Counts = .{ .a = 0, .c = 0, .g = 0, .t = 0 };
    for (s) |c| {
        if (c == 'A') {
            cnts.a += 1;
        } else if (c == 'C') {
            cnts.c += 1;
        } else if (c == 'G') {
            cnts.g += 1;
        } else if (c == 'T') {
            cnts.t += 1;
        } else {
            return NucleotideError.Invalid;
        }
    }

    return cnts;
}
