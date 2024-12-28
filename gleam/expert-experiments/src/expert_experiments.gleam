import gleam/result

pub fn with_retry(experiment: fn() -> Result(t, e)) -> Result(t, e) {
    let res = experiment()
    case res { 
        Ok(x) -> res
        Error(x) -> experiment()
    }
}

pub fn record_timing(
  time_logger: fn() -> Nil,
  experiment: fn() -> Result(t, e),
) -> Result(t, e) {
    time_logger()
    let res = experiment()
    time_logger()

    res
}

pub fn run_experiment(
  name: String,
  setup: fn() -> Result(t, e),
  action: fn(t) -> Result(u, e),
  record: fn(t, u) -> Result(v, e),
) -> Result(#(String, v), e) {
    use a <- result.try(setup())
    use b <- result.try(action(a))
    use r <- result.try(record(a,b))
    result.try(Ok(r), fn(x) { Ok(#(name, x)) })
}
