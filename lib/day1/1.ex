defmodule TrackTheBunny do
  def calculateBunnyLocation do
    directions = parse_directions()
  end

  defp parse_directions do
    path = ReadInput.from_day(1)
    directions = String.split(path, ', ')
    Enum.map(directions, fn(direction) ->
      String.split(direction, '', parts: 2)
    end)
  end

  def adjust(axis, current, adjustment) do

  end
end
