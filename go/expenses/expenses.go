package expenses

import (
    "errors"
)

// Record represents an expense record.
type Record struct {
	Day      int
	Amount   float64
	Category string
}

// DaysPeriod represents a period of days for expenses.
type DaysPeriod struct {
	From int
	To   int
}

// Filter returns the records for which the predicate function returns true.
func Filter(in []Record, predicate func(Record) bool) []Record {
    out := make([]Record, 0)
    for _, i := range in {
        if predicate != nil {
            if predicate(i) {
                out = append(out, i)
            }
        }
    }

    return out
}

// ByDaysPeriod returns predicate function that returns true when
// the day of the record is inside the period of day and false otherwise.
func ByDaysPeriod(p DaysPeriod) func(Record) bool {
	return func(r Record) bool {
        return p.From <= r.Day && p.To >= r.Day
    }
}

// ByCategory returns predicate function that returns true when
// the category of the record is the same as the provided category
// and false otherwise.
func ByCategory(c string) func(Record) bool {
	return func(r Record) bool {
        return r.Category == c
    }
}

// TotalByPeriod returns total amount of expenses for records
// inside the period p.
func TotalByPeriod(in []Record, p DaysPeriod) float64 {
    f_recs := Filter(in, ByDaysPeriod(p))
 
    amt := 0.0
    for _, rec := range f_recs {
        amt += rec.Amount
    }

    return amt
}

// CategoryExpenses returns total amount of expenses for records
// in category c that are also inside the period p.
// An error must be returned only if there are no records in the list that belong
// to the given category, regardless of period of time.
func CategoryExpenses(in []Record, p DaysPeriod, c string) (float64, error) {
    c_recs := Filter(in, ByCategory(c))
    if len(c_recs) == 0 {
        return 0.0, errors.New("unknown category " + c)
    }

    return TotalByPeriod(c_recs, p), nil
}
