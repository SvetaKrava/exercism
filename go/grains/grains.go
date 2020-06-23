// Package grains will do grainy things
package grains

/* 	Commented versions were faster, but did not use bitwise operations to solve.
	The uncommented version shows the use of bitwise operators.
*/

import (
	"errors"
)

//var square uint64
var pos int

/*
// Square ...
func Square(i int) (uint64, error) {
	if i < 1 || i > 64 {
		return 0, errors.New("value must be between 1 and 64")
	}
	pos := float64(i - 1)
	square = uint64(math.Exp2(pos))
	return square, nil
}
*/

//Square ...
func Square(n int) (uint64, error) {
	if n < 1 || n > 64 {
		return 0, errors.New("value must be between 1 and 64")
	}
	pos = n
	return 1 << (pos - 1), nil
}

/*
// Total ...
func Total() uint64 {
	return (square * 2) - 1
}
*/

// Total ...
func Total() uint64 {
	return 1<<pos - 1
}
