package meteorology

import (
    "fmt"
    "strconv"
)

type TemperatureUnit int

const (
	Celsius    TemperatureUnit = 0
	Fahrenheit TemperatureUnit = 1
)

func (t TemperatureUnit) String() string {
    if t == Celsius {
        return "°C"
    } else if t == Fahrenheit {
        return "°F"
    }

    return "Unknown"
}

type Temperature struct {
	degree int
	unit   TemperatureUnit
}

func (t Temperature) String() string {
    return strconv.Itoa(t.degree) + " " + t.unit.String()
}

type SpeedUnit int

const (
	KmPerHour    SpeedUnit = 0
	MilesPerHour SpeedUnit = 1
)

func (u SpeedUnit) String() string {
    if u == KmPerHour {
        return "km/h"
    } else if u == MilesPerHour {
        return "mph"
    }

    return "Unknown"
}

type Speed struct {
	magnitude int
	unit      SpeedUnit
}

func (s Speed) String() string {
    return strconv.Itoa(s.magnitude) + " " + s.unit.String()
}

type MeteorologyData struct {
	location      string
	temperature   Temperature
	windDirection string
	windSpeed     Speed
	humidity      int
}

func (m MeteorologyData) String() string {
    return fmt.Sprintf("%s: %s, Wind %s at %s, %d%s", m.location, m.temperature.String(), m.windDirection, m.windSpeed.String(), m.humidity, "% Humidity")
}
