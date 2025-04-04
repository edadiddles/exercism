package sorting

import (
    "fmt"
    "strconv"
)

// DescribeNumber should return a string describing the number.
func DescribeNumber(f float64) string {
	return fmt.Sprintf("This is the number %.1f", f)
}

type NumberBox interface {
	Number() int
}

// DescribeNumberBox should return a string describing the NumberBox.
func DescribeNumberBox(nb NumberBox) string {
	return fmt.Sprintf("This is a box containing the number %.1f", float64(nb.Number()))
}

type FancyNumber struct {
	n string
}

func (i FancyNumber) Value() string {
	return i.n
}

type FancyNumberBox interface {
	Value() string
}

// ExtractFancyNumber should return the integer value for a FancyNumber
// and 0 if any other FancyNumberBox is supplied.
func ExtractFancyNumber(fnb FancyNumberBox) int {
    switch t := fnb.(type) {
    case FancyNumber:
        v, err := strconv.Atoi(t.Value())
        if err != nil {
            return 0
        }

        return v
    default:
        return 0
    }
}

// DescribeFancyNumberBox should return a string describing the FancyNumberBox.
func DescribeFancyNumberBox(fnb FancyNumberBox) string {
	return fmt.Sprintf("This is a fancy box containing the number %.1f", float64(ExtractFancyNumber(fnb)))
}

// DescribeAnything should return a string describing whatever it contains.
func DescribeAnything(i interface{}) string {
    switch x := i.(type) {
    case float64:
        return DescribeNumber(x)
    case int:
        return DescribeNumber(float64(x))
    case NumberBox:
        return DescribeNumberBox(x)
    case FancyNumberBox:
        return DescribeFancyNumberBox(x)
    default:
        return fmt.Sprint("Return to sender")
    }
}
