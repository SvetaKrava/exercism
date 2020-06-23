//Package raindrops does the raindrops stuffs
package raindrops

import "strconv"

//Convert gives us all the sounds
func Convert(n int) string {
	rainspeak := ""
	if n%3 == 0 {
		rainspeak += "Pling"
	}
	if n%5 == 0 {
		rainspeak += "Plang"
	}
	if n%7 == 0 {
		rainspeak += "Plong"
	}
	if len(rainspeak) == 0 {
		rainspeak = strconv.Itoa(n)
	}
	return rainspeak
}
