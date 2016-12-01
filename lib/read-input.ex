defmodule ReadInput do
  def fromDay(day) do
    {:ok, file} = File.read "/day#{day}/input.txt"
    
    file
  end
end
