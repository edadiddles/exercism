package reverse

func Reverse(input string) string {
    runes := make([]int32, 0)
    for _, rune := range input {
        runes = append([]int32{rune}, runes...)
    }

    return string(runes)
}
