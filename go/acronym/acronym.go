// Package acronym makes acronyms from words
package acronym

import (
	"strings"
)

// Abbreviate does the work
func Abbreviate(s string) string {
	abb := ""
	s = strings.TrimSpace(s)
	wasSpace := true
	for _, r := range s {
		if wasSpace && !IsSpace(r) { abb += string(r) }
		wasSpace = IsSpace(r)
	}
	return strings.ToUpper(abb)
}

// IsSpace checks for space like characters
func IsSpace(r rune) bool {
	return strings.Contains("-_ ", string(r))
}
