defmodule Day3 do
  def leg1 do
    parse_input(ReadInput.from_day(3))
    |> count_triangles
  end

  def leg2 do
    parse_vertical_input(ReadInput.from_day(3))
    |> count_triangles
  end

  defp count_triangles(list) do
    Enum.filter(list, fn(triad) -> is_triangle(triad) end)
    |> length
  end

  def is_triangle([a, b, c]) do
    a + b > c && a + c > b && b + c > a
  end

  def parse_input(raw) do
    String.split(raw, "\n")
      |> Enum.map(fn(x) ->
        String.split(x, " ", trim: true)
          |> Enum.map(fn(y) ->
            { n, _ } = Integer.parse(y)
            n
          end)
      end)
  end

  def parse_vertical_input(raw) do
    parse_input(raw)
      |> List.flatten
      |> Enum.with_index
      |> Enum.group_by(
        fn({ _, i }) -> rem(i, 3) + i - rem(i, 9) end,
        fn({ x, _ }) -> x end
      )
      |> Map.values
  end
end
