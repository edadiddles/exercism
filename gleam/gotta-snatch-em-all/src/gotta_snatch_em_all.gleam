import gleam/string
import gleam/list
import gleam/set.{type Set}

pub fn new_collection(card: String) -> Set(String) {
    set.new()
        |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
    let contained = collection |> set.contains(card)
    let set_updated = collection |> set.insert(card)
    #(contained, set_updated)
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
    let is_possible = collection |> set.contains(my_card)
    let #(already_owned, new_deck) = collection |> set.delete(my_card) |> add_card(their_card)
    #(is_possible && !already_owned, new_deck)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
    let intersections = case collections {
        [] -> set.new()
        [s] -> s
        [head, ..tail] -> tail |> list.fold(head, fn (acc, s) { s |> set.intersection(acc) })
    }

    intersections |> set.to_list |> list.sort(string.compare)
}

pub fn total_cards(collections: List(Set(String))) -> Int {
    collections
        |> list.fold(set.new(), fn (acc, s) {
                s |> set.union(acc)
            })
        |> set.size


}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
    collection
        |> set.filter(fn (s) {
                s |> string.starts_with("Shiny ")
            })
}
