package chessboard

type File []bool
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
    num_occupied := 0
    for _, v := range cb[file] {
       if v {
           num_occupied += 1
       }
    }

    return num_occupied
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
    num_occupied := 0
    for _, v := range cb {
        if rank > 0 && rank <= len(v) && v[rank-1] {
            num_occupied += 1
        }
    }

    return num_occupied
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
    cnt_squares := 0
    for _, file := range cb {
        for range file {
            cnt_squares += 1
        }
    }

    return cnt_squares
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
    num_occupied := 0
    for _, file := range cb {
        for _, v := range file {
            if v {
                num_occupied += 1
            }
        }
    }

    return num_occupied
}
