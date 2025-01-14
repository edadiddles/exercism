package airportrobot

import (
    "fmt"
)

// Write your code here.
// This exercise does not have tests for each individual task.
// Try to solve all the tasks first before running the tests.
type Greeter interface {
    LanguageName() string
    Greet(string) string
}

type Italian struct {
}

type Portuguese struct {
}

func (g Italian) LanguageName() string {
    return "Italian"
}
func (g Italian) Greet(visitor string) string {
    return fmt.Sprintf("Ciao %s!", visitor)
}

func (g Portuguese) LanguageName() string {
    return "Portuguese"
}
func (g Portuguese) Greet(visitor string) string {
    return fmt.Sprintf("Olá %s!", visitor)
}

func SayHello(visitor string, greeter Greeter) string {
    return fmt.Sprintf("I can speak %s: %s", greeter.LanguageName(), greeter.Greet(visitor))
}
