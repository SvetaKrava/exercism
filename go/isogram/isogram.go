//Package isogram tests for isograms
package isogram

import (
	"strings"
	"unicode"
)

//IsIsogram will check it out
func IsIsogram(word string) bool {
	letters := map[rune]int{}
	for _, r := range strings.ToLower(word) {
		if !isSpace(r) {
		letters[r]++
		if letters[r] > 1 {
			return false
		}
	}
	}
	return true
}

func isSpace(r rune) bool {
	return unicode.IsSpace(r) || string(r) == "-"
}
