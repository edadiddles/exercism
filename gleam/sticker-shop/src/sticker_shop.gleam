import gleam/list

pub type Usd
pub type Eur
pub type Jpy

// Please define the Money type
pub opaque type Money(currency) {
    Money(amt: Int)
}

pub fn dollar(amount: Int) -> Money(Usd) {
    Money(amount)
}

pub fn euro(amount: Int) -> Money(Eur) {
    Money(amount) 
}

pub fn yen(amount: Int) -> Money(Jpy) {
    Money(amount)
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
    let assert Ok(total) = 
        prices 
            |> list.reduce(fn(x: Money(currency), acc: Money(currency)) {  Money(acc.amt + x.amt) })

    total
}
