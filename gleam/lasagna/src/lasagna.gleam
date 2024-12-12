pub fn expected_minutes_in_oven() {
    40
}

pub fn remaining_minutes_in_oven(mins_in_oven: Int) -> Int {
    expected_minutes_in_oven() - mins_in_oven
}

pub fn preparation_time_in_minutes(num_layers: Int) -> Int {
   num_layers * 2 
}

pub fn total_time_in_minutes(num_layers: Int, mins_in_oven: Int) -> Int {
    preparation_time_in_minutes(num_layers) + mins_in_oven
}

pub fn alarm() -> String {
    "Ding!"
}
