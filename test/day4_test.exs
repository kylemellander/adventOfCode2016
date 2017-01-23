defmodule Day4Test do
  use ExUnit.Case, async: true

  describe "test cases" do
    test "returns test case correctly" do
      case File.read "lib/day4/test_input.txt" do
        {:ok, file } ->
          rooms = Day4.parse_input(file)
          assert Day4.room_values(rooms) == 1514
      end
    end

    test "returns true for test case1" do
      raw = "aaaaa-bbb-z-y-x-123[abxyz]"
      room = Day4.parse_line(raw)

      assert Day4.verify_checksum(room)
    end

    test "returns true for test case2" do
      raw = "a-b-c-d-e-f-g-h-987[abcde]"
      room = Day4.parse_line(raw)

      assert Day4.verify_checksum(room)
    end

    test "returns true for test case3" do
      raw = "not-a-real-room-404[oarel]"
      room = Day4.parse_line(raw)

      assert Day4.verify_checksum(room)
    end

    test "returns false for test case4" do
      raw = "totally-real-room-200[decoy]"
      room = Day4.parse_line(raw)

      assert !Day4.verify_checksum(room)
    end
  end

  describe "leg1/0" do
    test "returns the correct answer" do
      assert Day4.leg1 == 185371
    end
  end

  describe "leg2/0" do
    test "returns the correct answer" do
      assert Day4.leg2 == 984
    end
  end

  describe "parse_input/1" do
    test "creates a list with parsed data" do
      raw = "bkwzkqsxq-tovvilokx-nozvyiwoxd-172[fstek]"

      assert Day4.parse_input(raw) ==
        [%{ name: "bkwzkqsxqtovvilokxnozvyiwoxd", id: 172, checksum: "fstek" }]
    end

    test "creates multiple lines into multiple items in the list" do
      raw = "bkwzkqsxq-tovvilokx-187[fstek]\nabc-123[abc]"

      assert Day4.parse_input(raw) == [
        %{ name: "bkwzkqsxqtovvilokx", id: 187, checksum: "fstek" },
        %{ name: "abc", id: 123, checksum: "abc" }
      ]
    end
  end

  describe "actual_checksum/1" do
    test "returns checksum of inputed string if string matches checksum" do
      assert Day4.actual_checksum("abcde") == "abcde"
    end

    test "returns checksum of inputed string that matches but is jumbled" do
      assert Day4.actual_checksum("dcaeb") == "abcde"
    end

    test "returns checksum of 5 letters if longer than 5" do
      str = "aadbbbcceeee"

      assert Day4.actual_checksum(str) == "ebacd"
    end
  end

  describe "verify_checksum/1" do
    test "returns true if actual_checksum matches checksum privided" do
      room = %{ name: "bacde", id: 187, checksum: "abcde" }

      assert Day4.verify_checksum(room)
    end

    test "returns false if actual_checksum does not match checksum" do
      room = %{ name: "bacdee", id: 187, checksum: "abcde" }

      assert !Day4.verify_checksum(room)
    end

    test "returns true for breaking room" do
      room = %{ name: "jchipqatqphztirjhidbtghtgkxrt", id: 271, checksum: "thigj" }

      assert Day4.actual_checksum(room.name) == "thigj"
      assert Day4.verify_checksum(room)
    end
  end

  describe "room_value/1" do
    test "returns room id if actual_checksum matches checksum privided" do
      room = %{ name: "bacde", id: 187, checksum: "abcde" }

      assert Day4.room_value(room) == 187
    end

    test "returns 0 if actual_checksum does not match checksum" do
      room = %{ name: "bacdee", id: 187, checksum: "abcde" }

      assert Day4.room_value(room) == 0
    end
  end

  describe "room_values/1" do
    test "returns the sum of room ids if all are valid" do
      rooms = [
        %{ name: "bacde", id: 187, checksum: "abcde" },
        %{ name: "qrstu", id: 13, checksum: "qrstu" }
      ]

      assert Day4.room_values(rooms) == 200
    end
  end
end
