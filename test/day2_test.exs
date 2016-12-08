defmodule Day2Test do
  use ExUnit.Case, async: true

  describe "parse_input/0" do
    test "creates a list 5 long" do
      assert length(Day2.parse_input(ReadInput.from_day(2))) == 5
    end
  end

  describe "move/2" do
    test "1-U == 1" do
      assert Day2.move(1, "U") == 1
    end

    test "1-D == 4" do
      assert Day2.move(1, "D") == 4
    end

    test "1-L == 1" do
      assert Day2.move(1, "L") == 1
    end

    test "1-R == 2" do
      assert Day2.move(1, "R") == 2
    end

    test "2-U == 2" do
      assert Day2.move(2, "U") == 2
    end

    test "2-D == 5" do
      assert Day2.move(2, "D") == 5
    end

    test "2-L == 1" do
      assert Day2.move(2, "L") == 1
    end

    test "2-R == 3" do
      assert Day2.move(2, "R") == 3
    end

    test "3-U == 3" do
      assert Day2.move(3, "U") == 3
    end

    test "3-D == 6" do
      assert Day2.move(3, "D") == 6
    end

    test "3-L == 2" do
      assert Day2.move(3, "L") == 2
    end

    test "3-R == 3" do
      assert Day2.move(3, "R") == 3
    end

    test "4-U == 1" do
      assert Day2.move(4, "U") == 1
    end

    test "4-D == 7" do
      assert Day2.move(4, "D") == 7
    end

    test "4-L == 4" do
      assert Day2.move(4, "L") == 4
    end

    test "4-R == 5" do
      assert Day2.move(4, "R") == 5
    end

    test "5-U == 2" do
      assert Day2.move(5, "U") == 2
    end

    test "5-D == 8" do
      assert Day2.move(5, "D") == 8
    end

    test "5-L == 4" do
      assert Day2.move(5, "L") == 4
    end

    test "5-R == 6" do
      assert Day2.move(5, "R") == 6
    end

    test "6-U == 3" do
      assert Day2.move(6, "U") == 3
    end

    test "6-D == 9" do
      assert Day2.move(6, "D") == 9
    end

    test "6-L == 5" do
      assert Day2.move(6, "L") == 5
    end

    test "6-R == 6" do
      assert Day2.move(6, "R") == 6
    end

    test "7-U == 4" do
      assert Day2.move(7, "U") == 4
    end

    test "7-D == 7" do
      assert Day2.move(7, "D") == 7
    end

    test "7-L == 7" do
      assert Day2.move(7, "L") == 7
    end

    test "7-R == 8" do
      assert Day2.move(7, "R") == 8
    end

    test "8-U == 5" do
      assert Day2.move(8, "U") == 5
    end

    test "8-D == 8" do
      assert Day2.move(8, "D") == 8
    end

    test "8-L == 7" do
      assert Day2.move(8, "L") == 7
    end

    test "8-R == 9" do
      assert Day2.move(8, "R") == 9
    end

    test "9-U == 6" do
      assert Day2.move(9, "U") == 6
    end

    test "9-D == 9" do
      assert Day2.move(9, "D") == 9
    end

    test "9-L == 8" do
      assert Day2.move(9, "L") == 8
    end

    test "9-R == 9" do
      assert Day2.move(9, "R") == 9
    end
  end

  describe "next_number/2" do
    test "calculates the move when only one direction given" do
      assert Day2.next_number(5, ["U"]) == 2
    end

    test "calculates multiple directions" do
      assert Day2.next_number(5, ["U", "U", "L", "L", "D", "R"]) == 5
    end
  end

  describe "code_list/2" do
    test "returns result" do
      assert Day2.code_list([["U"], ["D"], ["L"], ["R"]], 5) == [2, 5, 4, 5]
    end

    test "returns result of first movement" do
      assert Day2.code_list([Enum.at(Day2.parse_input(ReadInput.from_day(2)), 0)], 5) == [3]
    end

    test "returns result of second movement" do
      assert Day2.code_list([Enum.at(Day2.parse_input(ReadInput.from_day(2)), 1)], 3) == [3]
    end

    test "returns result of 3rd movement" do
      assert Day2.code_list([Enum.at(Day2.parse_input(ReadInput.from_day(2)), 2)], 3) == [4]
    end

    test "returns result of 4th movement" do
      assert Day2.code_list([Enum.at(Day2.parse_input(ReadInput.from_day(2)), 3)], 4) == [4]
    end

    test "returns result of 5th movement" do
      assert Day2.code_list([Enum.at(Day2.parse_input(ReadInput.from_day(2)), 4)], 4) == [4]
    end

    test "returns result of input" do
      assert Day2.code_list(Day2.parse_input(ReadInput.from_day(2)), 5) == [3, 3, 4, 4, 4]
    end

    test "example" do
      assert Day2.code_list(Day2.parse_input("ULL
RRDDD
LURDL
UUUUD"
      ), 5) == [1, 9, 8, 5]
    end

    test "direct input" do
      assert Day2.code_list(Day2.parse_input(
      "RDLULDLDDRLLLRLRULDRLDDRRRRURLRLDLULDLDLDRULDDLLDRDRUDLLDDRDULLLULLDULRRLDURULDRUULLLUUDURURRDDLDLDRRDDLRURLLDRRRDULDRULURURURURLLRRLUDULDRULLDURRRLLDURDRRUUURDRLLDRURULRUDULRRRRRDLRLLDRRRDLDUUDDDUDLDRUURRLLUDUDDRRLRRDRUUDUUULDUUDLRDLDLLDLLLLRRURDLDUURRLLDLDLLRLLRULDDRLDLUDLDDLRDRRDLULRLLLRUDDURLDLLULRDUUDRRLDUDUDLUURDURRDDLLDRRRLUDULDULDDLLULDDDRRLLDURURURUUURRURRUUDUUURULDLRULRURDLDRDDULDDULLURDDUDDRDRRULRUURRDDRLLUURDRDDRUDLUUDURRRLLRR
      RDRRLURDDDDLDUDLDRURRLDLLLDDLURLLRULLULUUURLDURURULDLURRLRULDDUULULLLRLLRDRRUUDLUUDDUDDDRDURLUDDRULRULDDDLULRDDURRUURLRRLRULLURRDURRRURLDULULURULRRLRLUURRRUDDLURRDDUUDRDLLDRLRURUDLDLLLLDLRURDLLRDDUDDLDLDRRDLRDRDLRRRRUDUUDDRDLULUDLUURLDUDRRRRRLUUUDRRDLULLRRLRLDDDLLDLLRDDUUUUDDULUDDDUULDDUUDURRDLURLLRUUUUDUDRLDDDURDRLDRLRDRULRRDDDRDRRRLRDULUUULDLDDDUURRURLDLDLLDLUDDLDLRUDRLRLDURUDDURLDRDDLLDDLDRURRULLURULUUUUDLRLUUUDLDRUDURLRULLRLLUUULURLLLDULLUDLLRULRRLURRRRLRDRRLLULLLDURDLLDLUDLDUDURLURDLUURRRLRLLDRLDLDRLRUUUDRLRUDUUUR
      LLLLULRDUUDUUDRDUUURDLLRRLUDDDRLDUUDDURLDUDULDRRRDDLLLRDDUDDLLLRRLURDULRUUDDRRDLRLRUUULDDULDUUUDDLLDDDDDURLDRLDDDDRRDURRDRRRUUDUUDRLRRRUURUDURLRLDURDDDUDDUDDDUUDRUDULDDRDLULRURDUUDLRRDDRRDLRDLRDLULRLLRLRLDLRULDDDDRLDUURLUUDLLRRLLLUUULURUUDULRRRULURUURLDLLRURUUDUDLLUDLDRLLRRUUDDRLUDUDRDDRRDDDURDRUDLLDLUUDRURDLLULLLLUDLRRRUULLRRDDUDDDUDDRDRRULURRUUDLUDLDRLLLLDLUULLULLDDUDLULRDRLDRDLUDUDRRRRLRDLLLDURLULUDDRURRDRUDLLDRURRUUDDDRDUUULDURRULDLLDLDLRDUDURRRRDLDRRLUDURLUDRRLUDDLLDUULLDURRLRDRLURURLUUURRLUDRRLLULUULUDRUDRDLUL
      LRUULRRUDUDDLRRDURRUURDURURLULRDUUDUDLDRRULURUDURURDRLDDLRUURLLRDLURRULRRRUDULRRULDLUULDULLULLDUDLLUUULDLRDRRLUURURLLUUUDDLLURDUDURULRDLDUULDDRULLUUUURDDRUURDDDRUUUDRUULDLLULDLURLRRLRULRLDLDURLRLDLRRRUURLUUDULLLRRURRRLRULLRLUUDULDULRDDRDRRURDDRRLULRDURDDDDDLLRRDLLUUURUULUDLLDDULDUDUUDDRURDDURDDRLURUDRDRRULLLURLUULRLUDUDDUUULDRRRRDLRLDLLDRRDUDUUURLRURDDDRURRUDRUURUUDLRDDDLUDLRUURULRRLDDULRULDRLRLLDRLURRUUDRRRLRDDRLDDLLURLLUDL
      ULURLRDLRUDLLDUDDRUUULULUDDDDDRRDRULUDRRUDLRRRLUDLRUULRDDRRLRUDLUDULRULLUURLLRLLLLDRDUURDUUULLRULUUUDRDRDRUULURDULDLRRULUURURDULULDRRURDLRUDLULULULUDLLUURULDLLLRDUDDRRLULUDDRLLLRURDDLDLRLLLRDLDRRUUULRLRDDDDRUDRUULDDRRULLDRRLDDRRUDRLLDUDRRUDDRDLRUDDRDDDRLLRDUULRDRLDUDRLDDLLDDDUUDDRULLDLLDRDRRUDDUUURLLUURDLULUDRUUUDURURLRRDULLDRDDRLRDULRDRURRUDLDDRRRLUDRLRRRRLLDDLLRLDUDUDDRRRUULDRURDLLDLUULDLDLDUUDDULUDUDRRDRLDRDURDUULDURDRRDRRLLRLDLU"
      ), 5) == [3, 3, 4, 4, 4]
    end
  end

  describe "leg1/0" do
    test "returns result of day2 leg1" do
      assert Day2.leg1 == "33444"
    end
  end
end
