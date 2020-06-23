// Package letter ...
package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

//ConcurrentFrequency ...
func ConcurrentFrequency(input []string) FreqMap {
	ch := make(chan FreqMap)
	for _, str := range input {
		go func(str string) {
			ch <- Frequency(str)
		}(str)
	}

	res := FreqMap{}
	for range input {
		tmpMap := <-ch
		for k, v := range tmpMap {
			val, exist := res[k]
			if exist {
				res[k] = v + val
			} else {
				res[k] = v
			}
		}
	}

	return res
}