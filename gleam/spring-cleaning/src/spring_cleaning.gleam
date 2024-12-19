import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
    let assert Error(err) = problem
    err
}

pub fn remove_team_prefix(team: String) -> String {
    team |> string.replace("Team ", "")
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
    let assert Ok(#(region, team)) = combined |> string.split_once(",")
    #(region, remove_team_prefix(team))
}