// Package clock ...
package clock

import "fmt"

// Clock structure
type Clock struct {
	hour   int
	minute int
}

// New - creates a clock
func New(h int, m int) Clock {
	c := Clock{h, m}
	return c.adjust()
}

// String - string rep of clock
func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}

// Add - adds minutes to clock
func (c Clock) Add(m int) Clock {
	c.minute += m
	return c.adjust()
}

// Subtract - subtracts minutes from clock
func (c Clock) Subtract(m int) Clock {
	c.minute -= m
	return c.adjust()
}

func (c Clock) adjust() Clock {
	c.hour += (c.minute / 60)
	c.minute = (c.minute % 60)
	for c.minute < 0 {
		c.minute += 60
		c.hour--
	}
	c.hour %= 24
	for c.hour < 0 {
		c.hour += 24
	}
	return c
}
