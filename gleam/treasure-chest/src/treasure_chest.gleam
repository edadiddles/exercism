pub type TreasureChest(treasure) {
    TreasureChest(password: String, treasure)
}

pub type UnlockResult(treasure) {
    Unlocked(treasure)
    WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
    case chest {
        TreasureChest(p, t) if p == password -> Unlocked(t)
        _ -> WrongPassword
    }
}
