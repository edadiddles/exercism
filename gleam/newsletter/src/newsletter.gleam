import gleam/list
import gleam/string
import gleam/result
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
    let assert Ok(contents) = simplifile.read(path)
    let emails = contents
        |> string.trim
        |> string.split("\n")

    Ok(emails)
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
    let assert Ok(_) = simplifile.create_file(path)

    Ok(Nil)
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
    let e = email |> string.append("\n")
    let assert Ok(_) = simplifile.append(path, e)
    Ok(Nil)
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
    let assert Ok(_) = create_log_file(log_path)

    read_emails(emails_path)
        |> result.unwrap([])
        |> list.each(fn(x) {
            result.try(send_email(x), fn(_) {
                log_sent_email(log_path, x)
            })
        })

    Ok(Nil)

}
