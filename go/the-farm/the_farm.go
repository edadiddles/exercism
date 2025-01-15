package thefarm

import (
    "fmt"
    "errors"
)

type InvalidCowsError struct {
    message string
    details string
}

func (e *InvalidCowsError) Error() string {
    return fmt.Sprintf("%s: %s", e.details, e.message)
}

func DivideFood(calc FodderCalculator, numCows int) (float64, error) {
    amt, err := calc.FodderAmount(numCows)
    if err != nil {
        return 0, err
    }

    factor, err := calc.FatteningFactor()
    if err != nil {
        return 0, err
    }

    return amt*factor/float64(numCows), nil
}

func ValidateInputAndDivideFood(calc FodderCalculator, numCows int) (float64, error) {
    if numCows <= 0 {
        return 0, errors.New("invalid number of cows")
    }
    return DivideFood(calc, numCows)
}

func ValidateNumberOfCows(numCows int) error {
    if numCows < 0 {
        return &InvalidCowsError{ 
            message: "there are no negative cows", 
            details: fmt.Sprintf("%d cows are invalid", numCows),
        }
    } else if numCows == 0 {
        return &InvalidCowsError{ 
            message: "no cows don't need food", 
            details: fmt.Sprintf("%d cows are invalid", numCows),
        }
    }

    return nil
}
