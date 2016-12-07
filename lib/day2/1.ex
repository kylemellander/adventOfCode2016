defmodule Day2 do
  def leg1 do
    input = parse_input(ReadInput.from_day(2))
    code_list(5, input)
      |> Enum.join("")
  end

  def leg2 do
    parse_input(ReadInput.from_day(2))
      |> base13_code(5)
      |> Enum.map(fn(x) -> letterize(x) end)
      |> Enum.join("")
  end

  def code_list(start, input) do
    { result, _ } = Enum.map_reduce(input, start, fn(directions, position) ->
      new_number = next_number(position, directions)
      { new_number, new_number }
    end)

    result
  end

  def letterize(x) do
    case x do
      10 -> "A"
      11 -> "B"
      12 -> "C"
      13 -> "D"
      _ -> x
    end
  end

  def base13_code(input, start) do
    { result, _ } = Enum.map_reduce(input, start, fn(directions, position) ->
      new_number = next_base13_number(position, directions)
      { new_number, new_number }
    end)

    result
  end

  def next_number(start, directions) do
    Enum.reduce(directions, start, fn(direction, position) ->
      move(position, direction)
    end)
  end

  def next_base13_number(start, directions) do
    Enum.reduce(directions, start, fn(direction, position) ->
      move13(position, direction)
    end)
  end

  def move(position, direction) do
    case direction do
      "U" ->
        if position - 3 > 0, do: position - 3, else: position
      "D" ->
        if position + 3 < 10, do: position + 3, else: position
      "R" ->
        if rem(position, 3) == 0, do: position, else: position + 1
      "L" ->
        if rem(position - 1, 3) == 0, do: position, else: position - 1
      _ ->
        position
    end
  end

  def move13(position, direction) do
    case direction do
      "U" ->
        cond do
          Enum.member?([3, 13], position) ->
            position - 2
          5 < position && rem(position - 1, 4) != 0 ->
            position - 4
          true -> position
        end
      "D" ->
        cond do
          position == 1 || position == 11 -> position + 2
          position < 9 && rem(position - 1, 4) != 0 -> position + 4
          true -> position
        end
      "R" ->
        cond do
          Enum.member?([2, 3, 5, 6, 7, 8, 10, 11], position) -> position + 1
          true -> position
        end
      "L" ->
        cond do
          Enum.member?([3, 4, 6, 7, 8, 9, 11, 12], position) -> position - 1
          true -> position
        end
      _ -> position
    end
  end

  def parse_input(raw) do
    String.split(raw, "\n")
      |> Enum.map(fn(x) -> String.split(x, "") end)
  end
end
