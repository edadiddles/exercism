package logs

// Application identifies the application emitting the given log.
func Application(log string) string {
    app := "default"
    for _, char := range log {
        if char == '\u2757' {
            app = "recommendation"
            break
        } else if char == '🔍' {
            app = "search"
            break
        } else if char == '\u2600' {
            app = "weather"
            break
        }
    }

    return app
}

// Replace replaces all occurrences of old with new, returning the modified log
// to the caller.
func Replace(log string, oldRune, newRune rune) string {
    rune_str := []rune(log)
    for i:=0; i < len(rune_str); i++ {
        if rune_str[i] == oldRune {
            rune_str[i] = newRune
        }
    }

    return string(rune_str)
}

// WithinLimit determines whether or not the number of characters in log is
// within the limit.
func WithinLimit(log string, limit int) bool {
    return len([]rune(log)) <= limit
}
