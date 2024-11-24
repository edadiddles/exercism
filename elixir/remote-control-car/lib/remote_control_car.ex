defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    car = new()
    %{car | nickname: nickname}
  end
  
  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance_driven_in_meters}) do
    "#{distance_driven_in_meters} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery_percentage}) do
    case battery_percentage do
      0 -> "Battery empty"
      _ -> "Battery at #{battery_percentage}%"
    end
  end

  def drive(%RemoteControlCar{} = remote_car) when remote_car.battery_percentage == 0, do: remote_car
  def drive(%RemoteControlCar{} = remote_car) do
    rc = %RemoteControlCar{remote_car | battery_percentage: remote_car.battery_percentage-1}
    %RemoteControlCar{rc | distance_driven_in_meters: remote_car.distance_driven_in_meters+20}
  end
end
