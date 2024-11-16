defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - discount/100)
  end

  def monthly_rate(hourly_rate, discount) do
    m_rate = 22.0 * daily_rate(hourly_rate)
    m_rate_discount = apply_discount(m_rate, discount)
    ceil(m_rate_discount)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    d_rate = daily_rate(hourly_rate)
    d_rate_discounted = apply_discount(d_rate, discount)
    Float.floor(budget/d_rate_discounted,1)
  end
end
