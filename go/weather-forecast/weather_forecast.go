// Package weather provides the forecasted weather for a particular city and currentCondition.
package weather

// CurrentCondition stores the current weather condition provided as a string.
var CurrentCondition string
// CurrentLocation stores the current location provided as a string.
var CurrentLocation string

// Forecast prints a string containing the city and condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
