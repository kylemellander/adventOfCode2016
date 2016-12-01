defmodule ReadInput do
  def from_day(day) do
    {:ok, file} = File.read "/day#{day}/input.txt"

    file
  end
end
