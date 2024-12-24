package lasagna

func PreparationTime(layers []string, avgLayerTime int) int {
    if avgLayerTime == 0 {
        avgLayerTime = 2
    }

    return len(layers) * avgLayerTime
}

func Quantities(layers []string) (noodles int, sauce float64) {
    noodles = 0
    sauce = 0.0
    for _, layer := range layers {
        if (layer == "noodles") {
            noodles += 50
        } else if (layer == "sauce") {
            sauce += 0.2
        }
    }
    return 
}

func AddSecretIngredient(friendLayers []string, myLayers []string) {
    myLayers[len(myLayers)-1] = friendLayers[len(friendLayers)-1]
}

func ScaleRecipe(dosPortions []float64, portionsDesired int) []float64 {
    recipe := make([]float64, len(dosPortions))

    for i:=0; i < len(dosPortions); i++ {
        recipe[i] = dosPortions[i] * float64(portionsDesired)/2.0
    }

    return recipe
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
// 
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more 
// functionality.
