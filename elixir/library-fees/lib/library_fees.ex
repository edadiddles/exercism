defmodule LibraryFees do
  def datetime_from_string(string) do
    {atom, dt} = NaiveDateTime.from_iso8601(string)
    case atom do
      :ok -> dt
    end
  end

  def before_noon?(datetime) do
    Time.before?(datetime, ~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    case before_noon?(checkout_datetime) do
      true -> Date.add(checkout_datetime, 28)
      false -> Date.add(checkout_datetime, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case Date.before?(actual_return_datetime, planned_return_date) do
      true -> 0
      false -> Date.diff(actual_return_datetime, planned_return_date)
    end
  end

  def monday?(datetime) do
    Date.day_of_week(datetime, :monday) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    n_return = return |> datetime_from_string
    d_late = checkout |> datetime_from_string |> return_date |> days_late(n_return)

    case monday?(n_return) do
      true -> (rate * d_late * 0.5) |> floor
      false -> rate * d_late
    end
  end
end
