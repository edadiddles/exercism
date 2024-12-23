package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
    var val int

    switch card {
    case "ace":
        val = 11
    case "king":
        val = 10
    case "queen":
        val = 10
    case "jack":
        val = 10
    case "ten":
        val = 10
    case "nine":
        val = 9
    case "eight":
        val = 8
    case "seven":
        val = 7
    case "six":
        val = 6
    case "five":
        val = 5
    case "four":
        val = 4
    case "three":
        val = 3
    case "two":
        val = 2
    default:
        val = 0
    }

    return val
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
    myVal := ParseCard(card1) + ParseCard(card2)
    dealerVal := ParseCard(dealerCard)

    action := "H"
    if myVal > 21 {
        action = "P"
    } else if myVal == 21 && dealerVal < 10 {
        action = "W"
    } else if (myVal == 21 && dealerVal >= 10) || myVal >= 17 {
        action = "S"
    } else if dealerVal < 7 && myVal >= 12 {
        action = "S"
    }
    
    return action
}
