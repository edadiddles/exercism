import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

const freezing_farenheit: Float = 32.0
const deg_width_factor: Float = 1.8

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. freezing_farenheit}/.deg_width_factor
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let assert [l, r] = [left, right]
    |> list.map(fn(x) {
            case x {
                Celsius(temp) -> temp
                Fahrenheit(temp) -> fahrenheit_to_celsius(temp)
            }
        })

    float.compare(l, r)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
    cities
        |> list.sort(fn (a, b) { compare_temperature(a.temperature, b.temperature) })
}
