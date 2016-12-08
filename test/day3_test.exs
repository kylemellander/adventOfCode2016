defmodule Day3Test do
  use ExUnit.Case, async: true

  describe "leg1/0" do
    test "returns count of possible triangles" do
      assert Day3.leg1 == 869
    end
  end

  describe "leg2/0" do
    test "returns count of possible triangles" do
      assert Day3.leg2 == 1544
    end
  end

  describe "is_triangle/1" do
    test "is a triangle" do
      assert Day3.is_triangle([1, 3, 3]) == true
    end

    test "is not a triangle" do
      assert Day3.is_triangle([1, 2, 4]) == false
    end

    test "is a line" do
      assert Day3.is_triangle([1, 2, 3]) == false
    end
  end

  describe "parse_input/1" do
    test "creates a list of lists with the triads" do
      assert Day3.parse_input(
      "810  679   10
      783  255  616
      545  626  626
       84  910  149"
      ) == [
        [810, 679, 10],
        [783, 255, 616],
        [545, 626, 626],
        [84, 910, 149]
      ]
    end
  end

  describe "parse_vertical_input/1" do
    test "creates a list of lists with the triads" do
      assert Day3.parse_vertical_input(
      "1  2   3
      4  5  6
      7  8  9
      10  11  12
      13  14  15
      16  17  18"
      ) == [[1, 4, 7], [2, 5, 8], [3, 6, 9], [10, 13, 16], [11, 14, 17], [12, 15, 18]]
    end
  end
end
