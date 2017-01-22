defmodule Day4Test do
  use ExUnit.Case, async: true

  describe "leg1/0" do
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
  end
end
