import gleam/option.{type Option, Some, None}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
    player.name |> option.lazy_unwrap( fn() { "Mighty Magician" })
}

pub fn revive(player: Player) -> Option(Player) {
    case player.health, player.level {
        health, level if health == 0 && level >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
        health, _ if health == 0 -> Some(Player(..player, health: 100))
        health, _ if health > 0 -> None
        _, _ -> None
    }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
    case player.mana, player.health {
        None, health if health <= cost -> #(Player(..player, health: 0), 0)
        None, health -> #(Player(..player, health: health-cost), 0)
        Some(mana), _ if mana < cost -> #(player, 0)
        Some(mana), _ -> #(Player(..player, mana: Some(mana-cost)), 2*cost)
    }
}
