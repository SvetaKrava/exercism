// Package scrabble does scrably things
package scrabble

import "strings"

var values = map[rune]int{}

// Score the letters submitted
func Score(word string) int {
	word = strings.ToLower(word)
	score := 0
	buildMap()
	for _, r := range word {
		score += values[r]
	}
	return score
}

func buildMap() {
	ones := []rune("aeioulnrst")
	twos := []rune("dg")
	threes := []rune("bcmp")
	fours := []rune("fhvwy")
	fives := []rune("k")
	eights := []rune("jx")
	tens := []rune("qz")

	for _, r := range ones {
		values[r] = 1
	}
	for _, r := range twos {
		values[r] = 2
	}
	for _, r := range threes {
		values[r] = 3
	}
	for _, r := range fours {
		values[r] = 4
	}
	for _, r := range fives {
		values[r] = 5
	}
	for _, r := range eights {
		values[r] = 8
	}
	for _, r := range tens {
		values[r] = 10
	}
}
