package bob

import (
	"strings"
	"unicode"
)

//Hey Bob
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	bobSay := "Whatever."
	if IsQuestion(remark) {
		if IsYelling(remark) {
			bobSay = "Calm down, I know what I'm doing!"
		} else {
			bobSay = "Sure."
		}
	} else if IsYelling(remark) {
		bobSay = "Whoa, chill out!"
	} else if IsSilent(remark) {
		bobSay = "Fine. Be that way!"
	}
	return bobSay
}

//IsQuestion tests if string is a quesetion
func IsQuestion(s string) bool {
	if strings.HasSuffix(s, "?") { return true }
	return false
}

//IsSilent tests for silence
func IsSilent(s string) bool {
	if len(s) == 0 { return true } 
	return false
}

//IsYelling tests if string is all uppercase
func IsYelling(s string) bool {
	letters := 0
	for _, r := range s {
		if !unicode.IsUpper(r) && unicode.IsLetter(r) { return false }
		if unicode.IsLetter(r) { letters++ }
	}
	if letters > 0 { return true }
	return false
}
