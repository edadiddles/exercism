import gleam/io
import gleam/list
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
    case nucleotide {
        Adenine -> 0b00
        Cytosine -> 0b01
        Guanine -> 0b10
        Thymine -> 0b11
    }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
    case nucleotide {
        0b00 -> Ok(Adenine)
        0b01 -> Ok(Cytosine)
        0b10 -> Ok(Guanine)
        0b11 -> Ok(Thymine)
        _ -> Error(Nil)
    }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
    dna
        |> list.fold(<<>>, fn (acc, n) {
                let nba = <<encode_nucleotide(n):size(2)>>
                <<acc:bits, nba:bits>> 
            })

}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
    dna |> decode_nucleotides |> result.all
}

fn decode_nucleotides(dna: BitArray) -> List(Result(Nucleotide, Nil)) {
    case dna {
        <<>> -> []
        <<n:size(2), tail:bits>> -> [decode_nucleotide(n)] |> list.append(decode_nucleotides(tail))
        _ -> [Error(Nil)]
    }
}
