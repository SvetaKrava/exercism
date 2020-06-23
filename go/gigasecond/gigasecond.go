package gigasecond

import "time"

//AddGigasecond does the work
func AddGigasecond(t time.Time) time.Time {
	t = t.Add(time.Second * 1e9)
	return t
}
