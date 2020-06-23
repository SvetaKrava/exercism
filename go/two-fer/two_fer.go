// Package twofer shares the stuff
package twofer

import "strings"

// ShareWith should have a comment documenting it, and this will do
func ShareWith(name string) string {
	name = strings.TrimSpace(name)
	if name == "" {
		name = "you"
	}
	return "One for " + name + ", one for me."
}
