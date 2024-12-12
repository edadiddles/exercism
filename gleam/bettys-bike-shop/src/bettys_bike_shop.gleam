import gleam/int
import gleam/float
import gleam/string

pub fn pence_to_pounds(pence: Int) -> Float {
    int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds: Float) -> String {
    let assert Ok(pound_cp) = string.utf_codepoint(163)
    let pound_sign = string.from_utf_codepoints([pound_cp])
    string.append(pound_sign, float.to_string(pounds))
}
