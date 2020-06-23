// Package reverse makes things backwards
package reverse

// Reverse option 2
func Reverse(s string) (ret string) {
	for _, r := range s {
		ret = string(r) + ret
	}
	return
}