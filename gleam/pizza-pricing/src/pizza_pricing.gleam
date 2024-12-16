import gleam/list

pub type Pizza {
    Margherita
    Caprese
    Formaggio
    ExtraSauce(Pizza)
    ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
    r_pizza_price(pizza, 0)
}

fn r_pizza_price(pizza: Pizza, acc: Int) -> Int {
    case pizza {
        Margherita -> 7 + acc
        Caprese -> 9 + acc
        Formaggio -> 10 + acc
        ExtraSauce(p) -> r_pizza_price(p, acc + 1)
        ExtraToppings(p) -> r_pizza_price(p, acc + 2)
    }
}

pub fn order_price(order: List(Pizza)) -> Int {
    case list.length(order) {
        1 -> r_order_price(order, 3)
        2 -> r_order_price(order, 2)
        _ -> r_order_price(order, 0)
    }

}

fn r_order_price(order: List(Pizza), acc: Int) -> Int {
    case order {
        [] -> acc
        [head, ..tail] -> r_order_price(tail, acc + pizza_price(head))
    }
}
