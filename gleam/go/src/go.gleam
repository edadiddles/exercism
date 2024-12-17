import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
    let result = game
        |> rule1
        |> result.try(fn (game) -> Result(Game, String) { 
                let g = game |> rule2
                Ok(g)
            })
        |> result.try(rule3)
        |> result.try(rule4)

    case result {
        Ok(g) -> Game(..g, player: change_player(g.player))
        Error(str) -> Game(..game, error: str)
    }
}

fn change_player(player: Player) -> Player {
    case player {
        White -> Black
        Black -> White
    }
}
