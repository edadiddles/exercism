defmodule Newsletter do
  def read_emails(path) do
    path |> File.read! |> String.split("\n", trim: true)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    pid |> IO.write(
        email <> "\n"
      )
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = emails_path |> read_emails
  
    log_pid = log_path |> open_log
    
    emails |> send_newsletter_to_email(log_pid, send_fun)

    log_pid |> close_log
  end
  
  defp send_newsletter_to_email([], _, _), do: nil
  defp send_newsletter_to_email([email | tail], pid, send) do
    sent? = send.(email)
    case sent? do
      :ok -> pid |> log_sent_email(email)
      _ -> nil
    end
    tail |> send_newsletter_to_email(pid, send)
  end
end
