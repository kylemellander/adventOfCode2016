defmodule Day2Test do
  use ExUnit.Case

  test "parse_input creates a list with the different inputs" do
    assert length(Day2.parse_input) == 5
  end
end
