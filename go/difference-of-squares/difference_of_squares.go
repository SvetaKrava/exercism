// Package diffsquares does the thing
package diffsquares

/*
// SquareOfSum blah blah blah
func SquareOfSum(n int) (ret int) {
	for i:=1; i <= n; i++ {
		ret += i
	}
	ret = ret * ret
	return
}
*/

// SquareOfSum blah blah blah
func SquareOfSum(n int) int {
	sum := n*(n+1)/2
	return sum * sum
}

/*
// SumOfSquares ....
func SumOfSquares(n int) (ret int) {
	for i:=1; i <= n; i++ {
		ret += i * i
	}
	return
}
*/

// SumOfSquares ....
func SumOfSquares(n int) int {
	return n*(n+1)*(2*n+1)/6
}

/*
// Difference ---
func Difference(n int) int {
	x := SquareOfSum(n)
	y := SumOfSquares(n)	
	return x - y
}
*/

// Difference ---
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
