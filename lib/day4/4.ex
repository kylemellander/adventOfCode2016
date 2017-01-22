defmodule Day4 do
  def leg1 do

  end

  def verify_checksum(%{ name: name, checksum: checksum }) do
    actual_checksum(name) == checksum
  end

  def actual_checksum(encrypted_name) do
    encrypted_name
    |> String.split("", trim: true)
    |> Enum.group_by(&String.to_atom/1)
    |> Map.values
    |> Enum.map(fn(list) -> { Enum.at(list, 0), Enum.count(list) } end)
    |> Enum.sort(fn({ key1, value1 }, { key2, value2 }) ->
      value1 >= value2 || key1 > key2
    end)
    |> best_letters(5)
  end

  def parse_input(raw) do
    raw
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
  end

  defp best_letters(list, n) do
    list
    |> Enum.map(fn({ key, _ }) -> key end)
    |> Enum.slice(0, n)
    |> Enum.join("")
  end

  defp input_as_tuple(list) do
    %{
      name: Enum.at(list, 0),
      id: Enum.at(list, 1)
      |> String.to_integer,
      checksum: Enum.at(list, 2)
    }
  end

  defp normalize_line(str) do
    str
    |> String.split(~r{-(?=\d)}, trim: true)
    |> Enum.map(fn(str) ->
      String.replace(str, ~r{[-\]]}, "")
      |> String.split("[")
    end)
    |> List.flatten
  end

  defp parse_line(str) do
    normalize_line(str)
    |> input_as_tuple
  end
end
