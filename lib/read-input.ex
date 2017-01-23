defmodule ReadInput do
  def from_day(day) do
    {:ok, file} = File.read "lib/day#{day}/input.txt"

    file
  end

  def test_from_day(day) do
    {:ok, file} = File.read "lib/day#{day}/test_input.txt"

    file
  end
end
