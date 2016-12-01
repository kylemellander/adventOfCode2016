defmodule TrackTheBunny do
  def calculate_bunny_location do
    parse_directions()
  end

  def turn_and_move(position, direction) do
    [turn, move] = direction
    location = turn(position, turn)
    move(location, move)
  end

  def turn([ x, y, multiplier, x_axis], turn) do
    new_multiplier = if (turn == "L" && x_axis) || (turn == "R" && !x_axis) do
      multiplier * -1
    else
      multiplier
    end
    [ x: x, y: y, multiplier: new_multiplier, x_axis: !x_axis ]
  end

  def move(position, move) do
    [ x, y, multiplier, x_axis] = position
    [
      x: if x_axis do x + Integer.parse(move) * multiplier else x end,
      y: unless x_axis do y + Integer.parse(move) * multiplier else y end,
      mulitiplier: multiplier,
      x_axis: x_axis
    ]
  end

  defp parse_directions do
    path = ReadInput.from_day(1)
    directions = String.split(path, ", ")
    Enum.map(directions, fn(direction) ->
      String.split(direction, "", parts: 2)
    end)
  end
end
