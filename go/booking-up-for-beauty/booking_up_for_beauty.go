package booking

import (
    "time"
    "fmt"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
    t, err := time.Parse("1/2/2006 15:04:05", date)
    if err != nil {
        fmt.Printf("error occurred: %d\n", err)
    }
    return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
    now := time.Now()
    dt, err := time.Parse("January 2, 2006 15:04:05", date) 
    if err != nil {
        fmt.Printf("error occurred: %d\n", err)
    }
    return now.After(dt)
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
    dt, err := time.Parse("Monday, January 2, 2006 15:04:05", date)
    if err != nil {
        fmt.Printf("error occurred: %d\n", err)
    }

    return dt.Hour() >= 12 && dt.Hour() < 18 
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
    dt := Schedule(date)
    return "You have an appointment on " + dt.Format("Monday, January 2, 2006, at 15:04.")
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
    dt, _ := time.Parse(time.DateOnly, "2024-09-15")
    return dt
}
