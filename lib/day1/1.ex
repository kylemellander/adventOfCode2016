defmodule Day1 do
  def leg1 do
    [ x: x, y: y, multiplier: _, x_axis: _, history: _ ] = calculate_bunny_location
    abs(x) + abs(y)
  end

  # def leg2 do
  #   history = calculate_bunny_location[:history]
  #   reverse_history = Enum.reverse(history)
  #   length = length(history)
  #   location = Enum.find(history, {0,0}, &(Enum.member?(List.delete(history, &1), &1)))
  #   # IO.inspect location
  #   # abs(location[:x]) + abs(location[:y])
  # end

  def calculate_bunny_location do
    directions = parse_directions
    start_position = [
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: false,
      history: [{ 0, 0 }]
    ]

    Enum.reduce(directions, start_position, fn(direction, position) ->
      turn_and_move(position, direction)
    end)
  end

  def turn_and_move(position, direction) do
    [turn, move] = direction
    { move_integer, _ } = Integer.parse(move)
    turn(position, turn)
      |> move(move_integer)
      # |> add_history
  end

  def turn([ x: x, y: y, multiplier: multiplier, x_axis: x_axis, history: history ], turn) do
    new_multiplier = cond do
      length(Enum.filter(history, fn(a) -> a == { x, y } end)) > 1 ->
        0
      (turn == "L" && !x_axis) || (turn == "R" && x_axis) ->
        multiplier * -1
      true ->
        multiplier
    end
    [ x: x, y: y, multiplier: new_multiplier, x_axis: !x_axis, history: history ]
  end

  def move([ x: x, y: y, multiplier: multiplier, x_axis: x_axis, history: history ], move) do
    [
      x: if x_axis do x + move * multiplier else x end,
      y: unless x_axis do y + move * multiplier else y end,
      multiplier: multiplier,
      x_axis: x_axis,
      history: history
    ]
  end

  # def add_history([ x: x, y: y, multiplier: multiplier, x_axis: x_axis, history: history ]) do
  #   [
  #     x: x,
  #     y: y,
  #     multiplier: multiplier,
  #     x_axis: x_axis,
  #     history: Enum.concat(history, [{ x, y }])
  #   ]
  # end

  def parse_directions do
    path = ReadInput.from_day(1)
    directions = String.split(path, ", ")
    Enum.map(directions, fn(direction) ->
      String.split(direction, "", parts: 2, trim: true)
    end)
  end
end
