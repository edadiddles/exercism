package parsinglogfiles

import (
    "fmt"
    "regexp"
)

func IsValidLine(text string) bool {
    re := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`)
    return re.FindString(text) != ""
}

func SplitLogLine(text string) []string {
    re := regexp.MustCompile(`<[~*=-]*>`)
    return re.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
    re := regexp.MustCompile(`\"[\w\s]*([pP][aA][sS][sS][wW][oO][rR][dD])[\w\s]*\"`)

    cnt := 0
    for _, line := range lines {
        cnt += len(re.FindAllString(line, -1))
    }
    return cnt
}

func RemoveEndOfLineText(text string) string {
    re := regexp.MustCompile(`end-of-line[\d]*`)
    return string(re.ReplaceAll([]byte(text), []byte("")))
}

func TagWithUserName(lines []string) []string {
    re := regexp.MustCompile(`User\s+(\w+)\s?`)
    
    for i:=0; i < len(lines); i++ {
        match_strs := re.FindStringSubmatch(lines[i])
        if len(match_strs) > 0 {
            lines[i] = fmt.Sprintf("[USR] %s %s", match_strs[1], lines[i])
        }
    }

    return lines
}
