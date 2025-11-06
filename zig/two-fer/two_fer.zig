
pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const name_output = name orelse "you";

    var idx: usize = 0;
    @memcpy(buffer[idx..idx+8], "One for ");
   
    idx += 8;
    @memcpy(buffer[idx..idx+name_output.len], name_output);
    
    idx += name_output.len;
    @memcpy(buffer[idx..idx+13], ", one for me.");

    idx += 13;
    return buffer[0..idx];
}
