// Package luhn does all the stuff
package luhn

import "strings"

//Valid - will see if it is valid
func Valid(num string) bool {
	num = strings.TrimSpace(num)
	if len(num) <= 1 {
		return false
	}
	num = reverse(num)
	var sum int
	for i, r := range num {
		y := int(r) - 48
		if y < 0 || y > 9 {
			return false
		}
		x := 1
		if i%2 == 1 {
			x = 2
		}
		sum += multiply(x, y)
	}
	return sum%10 == 0
}

func reverse(s string) (ret string) {
	for _, r := range s {
		if string(r) != " " {
			ret = string(r) + ret
		}
	}
	return
}

func multiply(x int, y int) (z int) {
	z = x * y
	if z > 9 {
		z -= 9
	}
	return
}
