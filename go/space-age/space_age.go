//Package space will find age and stuff
package space
 
//Planet string
type Planet string

const earthSeconds = 31557600

// Age calculates age on different planets
func Age(seconds float64, onPlanet Planet) float64 {
	planetYears := map[Planet]float64 {
		"Mercury": 0.2408467,
		"Venus": 0.61519726,
		"Earth": 1.0,
		"Mars": 1.8808158,
		"Jupiter": 11.862615,
		"Saturn": 29.447498,
		"Uranus": 84.016846,
		"Neptune": 164.79132,
	}
	return seconds/earthSeconds/planetYears[onPlanet]
}