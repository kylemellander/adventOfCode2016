defmodule Day4 do
  def leg1 do
    parse_input(ReadInput.from_day(4))
    |> room_values
  end

  def leg2 do
    room = parse_input(ReadInput.from_day(4))
      |> real_rooms
      |> real_names
      |> Enum.find(fn(%{ name: name }) -> north_pole?(name) end)

    room.id
  end

  def room_values(rooms) do
    Enum.reduce(rooms, 0, fn(room, acc) -> room_value(room) + acc end)
  end

  def room_value(room) do
    if verify_checksum(room), do: room.id, else: 0
  end

  def real_rooms(rooms) do
    Enum.filter(rooms, fn(room) -> verify_checksum(room) end)
  end

  def real_names(rooms) do
    Enum.map(rooms, fn(room) ->
      %{ name: real_name(room), id: room.id, checksum: room.checksum }
    end)
  end

  def real_name(%{ name: name, id: id, checksum: checksum }) do
    String.split(name, "", trim: true)
    |> Enum.map(fn(letter) -> real_letter(letter, id) end)
    |> Enum.join("")
  end

  def real_letter(letter, id) do
    convert_letter_to_number(letter)
    |> add(id)
    |> convert_number_to_letter
  end

  def convert_letter_to_number(letter) do
    Enum.find(letter_values, fn([l, _]) -> l == letter end)
    |> Enum.at(1)
  end

  def convert_number_to_letter(n) do
    number = rem(n, 26)
    Enum.find(letter_values, fn([_, num]) -> num == number end)
    |> Enum.at(0)
  end

  def letter_values do
    [
      ["a", 1], ["b", 2], ["c", 3], ["d", 4], ["e", 5], ["f", 6], ["g", 7],
      ["h", 8], ["i", 9], ["j", 10], ["k", 11], ["l", 12], ["m", 13], ["n", 14],
      ["o", 15], ["p", 16], ["q", 17], ["r", 18], ["s", 19], ["t", 20],
      ["u", 21], ["v", 22], ["w", 23], ["x", 24], ["y", 25], ["z", 0]
    ]
  end

  def north_pole?(name) do
    String.match?(name, ~r/^northpole/)
  end

  def verify_checksum(%{ name: name, checksum: checksum }) do
    actual_checksum(name) == checksum
  end

  def actual_checksum(encrypted_name) do
    encrypted_name
    |> String.split("", trim: true)
    |> Enum.group_by(&String.to_atom/1)
    |> Map.values
    |> Enum.sort(fn(letters1, letters2) ->
      Enum.count(letters1) >= Enum.count(letters2)
    end)
    |> best_letters(5)
  end

  def parse_input(raw) do
    raw
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp best_letters(list, n) do
    list
    |> Enum.map(fn(array) -> Enum.at(array, 0) end)
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

  def parse_line(str) do
    normalize_line(str)
    |> input_as_tuple
  end

  def add(a, b) do
    a + b
  end
end
