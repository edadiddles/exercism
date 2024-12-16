pub fn today(days: List(Int)) -> Int {
    case days {
        [] -> 0
        [head, .._tail] -> head
    }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
    case days {
        [head, ..tail] -> [head+1, ..tail]
        [] -> [1]
    }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
    case days {
        [] -> False
        [head, .._tail] if head == 0 -> True
        [_head, ..tail] -> has_day_without_birds(tail)
    }
}

pub fn total(days: List(Int)) -> Int {
    case days {
        [] -> 0
        [head, ..tail] -> head + total(tail)
    }
}

pub fn busy_days(days: List(Int)) -> Int {
    case days {
        [] -> 0
        [head, ..tail] if head >= 5 -> 1 + busy_days(tail)
        [_head, ..tail] -> busy_days(tail)
    }
}
