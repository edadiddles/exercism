import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
    let #(a, b) = place_location
    #(b, a)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
    treasure_location == place_location_to_treasure_location(place_location)
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
    let #(_, pl) = place
  
    treasures
        |> list.fold(0, fn (acc, treasure) {
                let #(_, tl) = treasure
                case place_location_to_treasure_location(pl) == tl {
                    True -> acc + 1
                    False -> acc
                }
            })
     
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
    let #(ft, _) = found_treasure
    let #(dt, _) = desired_treasure
    let #(p, _) = place

    case p {
        "Abandoned Lighthouse" if ft == "Brass Spyglass" -> True
        "Stormy Breakwater" if ft == "Amethyst Octopus" && {dt == "Crystal Crab" || dt == "Glass Starfish"} -> True
        "Harbor Managers Office" if ft == "Vintage Pirate Hat" && {dt == "Model Ship in Large Bottle" || dt == "Antique Glass Fishnet Float"} -> True
        _ -> False

    }
}
