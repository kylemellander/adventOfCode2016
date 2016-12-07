defmodule Day1Test do
  use ExUnit.Case

  test "move moves you in the direction you are facing" do
    assert Day1.move([
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: true,
      history: [{ 0, 0 }]
    ], 1) == [ x: 1, y: 0, multiplier: 1, x_axis: true, history: [{ 0, 0 }]]
    assert Day1.move([
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: false,
      history: [{ 0, 0 }]
    ], 1) == [ x: 0, y: 1, multiplier: 1, x_axis: false, history: [{ 0, 0 }] ]
    assert Day1.move([
      x: 0,
      y: 0,
      multiplier: -1,
      x_axis: true,
      history: [{ 0, 0 }]
    ], 1) == [ x: -1, y: 0, multiplier: -1, x_axis: true, history: [{ 0, 0 }] ]
    assert Day1.move([
      x: 0,
      y: 0,
      multiplier: -1,
      x_axis: false,
      history: [{ 0, 0 }]
    ], 1) == [ x: 0, y: -1, multiplier: -1, x_axis: false, history: [{ 0, 0 }] ]
  end

  test 'turn modifies the x_axis and the multiplier' do
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: true,
      history: [{ 0, 0 }]
    ], "L") == [ x: 0, y: 0, multiplier: 1, x_axis: false, history: [{ 0, 0 }] ]
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: true,
      history: [{ 0, 0 }]
    ], "R") == [ x: 0, y: 0, multiplier: -1, x_axis: false, history: [{ 0, 0 }] ]
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: -1,
      x_axis: true,
      history: [{ 0, 0 }]
    ], "L") == [ x: 0, y: 0, multiplier: -1, x_axis: false, history: [{ 0, 0 }] ]
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: -1,
      x_axis: true,
      history: [{ 0, 0 }]
    ], "R") == [ x: 0, y: 0, multiplier: 1, x_axis: false, history: [{ 0, 0 }] ]
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: false,
      history: [{ 0, 0 }]
    ], "L") == [ x: 0, y: 0, multiplier: -1, x_axis: true, history: [{ 0, 0 }] ]
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: false,
      history: [{ 0, 0 }]
    ], "R") == [ x: 0, y: 0, multiplier: 1, x_axis: true, history: [{ 0, 0 }] ]
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: -1,
      x_axis: false,
      history: [{ 0, 0 }]
    ], "L") == [ x: 0, y: 0, multiplier: 1, x_axis: true, history: [{ 0, 0 }] ]
    assert Day1.turn([
      x: 0,
      y: 0,
      multiplier: -1,
      x_axis: false,
      history: [{ 0, 0 }]
    ], "R") == [ x: 0, y: 0, multiplier: -1, x_axis: true, history: [{ 0, 0 }] ]
  end

  test 'turn_and_move turns and then moves' do
    assert Day1.turn_and_move([
      x: 0,
      y: 0,
      multiplier: 1,
      x_axis: true,
      history: [{ 0, 0 }]
    ], ["L", "1"]) == [ x: 0, y: 1, multiplier: 1, x_axis: false, history: [{ 0, 0 }] ]
  end

  test 'leg1 calculates the total path' do
    assert Day1.leg1 == 241
  end

  test 'calculate_bunny_location finds the final bunny location' do
    result = Day1.calculate_bunny_location
    assert result[:x] == 141
    assert result[:y] == -100
  end
end
