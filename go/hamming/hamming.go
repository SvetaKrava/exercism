//Package hamming is what's up
package hamming

import "errors"

//Distance - well the hamming distance at least
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("sequences must be the same length")
	}
	count := 0
	for i := 0; i < len(a); i++ {
		if string(a[i]) != string(b[i]) {
			count++
		}
	}
	return count, nil
}
