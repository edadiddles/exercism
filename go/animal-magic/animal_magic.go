package chance

import (
    "math/rand"
)

// RollADie returns a random int d with 1 <= d <= 20.
func RollADie() int {
	return rand.Intn(20)+1
}

// GenerateWandEnergy returns a random float64 f with 0.0 <= f < 12.0.
func GenerateWandEnergy() float64 {
	return rand.Float64()*12.0
}

type Animal struct {
    name string
    val int
}

// ShuffleAnimals returns a slice with all eight animal strings in random order.
func ShuffleAnimals() []string {
    animals := []Animal{}
    animals = append(animals, Animal{name: "ant", val: RollADie()})
    animals = append(animals, Animal{name: "beaver", val: RollADie()})
    animals = append(animals, Animal{name: "cat", val: RollADie()})
    animals = append(animals, Animal{name: "dog", val: RollADie()})
    animals = append(animals, Animal{name: "elephant", val: RollADie()})
    animals = append(animals, Animal{name: "fox", val: RollADie()})
    animals = append(animals, Animal{name: "giraffe", val: RollADie()})
    animals = append(animals, Animal{name: "hedgehog", val: RollADie()})
    

    for i:=0; i < len(animals)-1; i++ {
        for j:=1; j < len(animals); j++ {
            if animals[i].val > animals[j].val {
                tmp := animals[i]
                animals[i] = animals[j]
                animals[j] = tmp
            }
        }
    }

    shuffledAnimals := []string{}
    for i:=0; i < len(animals); i++ {
        shuffledAnimals = append(shuffledAnimals, animals[i].name)
    }
    return shuffledAnimals
}
