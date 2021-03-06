require 'minitest/autorun'
require '../beefy_robot'

class BeefyRobotTest < Minitest::Test
  attr_reader :beefy_robot

  def setup
    @beefy_robot = BeefyRobot.new
  end

  def test_can_place_robot_corrctly
    beefy_robot.place(0,0,"NORTH")
    assert_equal beefy_robot.report, "0,0,NORTH"
  end

  def test_can_set_valid_direction
    beefy_robot.place(0,0,"NORTH")
    assert_equal beefy_robot.direction, "NORTH"
    beefy_robot.place(0,0,"EAST")
    assert_equal beefy_robot.direction, "EAST"
    beefy_robot.place(0,0,"SOUTH")
    assert_equal beefy_robot.direction, "SOUTH"
    beefy_robot.place(0,0,"WEST")
    assert_equal beefy_robot.direction, "WEST"
  end

  def test_cannot_set_invalid_direction
    assert_raises ArgumentError do
      beefy_robot.place(0,0,"NORTHH")
    end

    assert_raises ArgumentError do
      beefy_robot.place(0,0,"north")
    end

    assert_raises ArgumentError do
      beefy_robot.place(0,0,:north)
    end

    assert_raises ArgumentError do
      beefy_robot.place(0,0,0)
    end
  end

  def test_can_move_forward
    beefy_robot.place(0, 0, "NORTH")
    beefy_robot.move
    assert_equal beefy_robot.report, "0,1,NORTH"

    beefy_robot.place(0, 0, "EAST")
    beefy_robot.move
    assert_equal beefy_robot.report, "1,0,EAST"

    beefy_robot.place(1, 1, "SOUTH")
    beefy_robot.move
    assert_equal beefy_robot.report, "1,0,SOUTH"

    beefy_robot.place(1, 1, "WEST")
    beefy_robot.move
    assert_equal beefy_robot.report, "0,1,WEST"
  end

  def test_cannot_move_off_board
    beefy_robot.place(1, 4, "NORTH")
    beefy_robot.move
    beefy_robot.move
    assert_equal beefy_robot.report, "Beefy Robot is not on the Board"
  end

  def test_cannot_place_off_board
    beefy_robot.place(5, 4, "NORTH")
    assert_equal beefy_robot.report, "Beefy Robot is not on the Board"
  end

  def test_continue_to_next_valid_position
    beefy_robot.place(4,4,"NORTH")
    beefy_robot.move
    assert_equal beefy_robot.report, "Beefy Robot is not on the Board"
    beefy_robot.place(4,4,"NORTH")
    assert_equal beefy_robot.report, "4,4,NORTH"
  end

  def test_can_move_back_onto_table
    beefy_robot.place(0, 0, "SOUTH")
    beefy_robot.move
    beefy_robot.left
    beefy_robot.move
    assert_equal beefy_robot.report, "Beefy Robot is not on the Board"
    beefy_robot.move
    beefy_robot.left
    beefy_robot.move
    assert_equal beefy_robot.report, "2,0,NORTH"
  end

  def test_can_turn_right
    beefy_robot.place(0, 0, "NORTH")
    beefy_robot.right
    assert_equal beefy_robot.direction, "EAST"
    beefy_robot.right
    assert_equal beefy_robot.direction, "SOUTH"
    beefy_robot.right
    assert_equal beefy_robot.direction, "WEST"
    beefy_robot.right
    assert_equal beefy_robot.direction, "NORTH"
  end

  def test_can_turn_left
    beefy_robot.place(0, 0, "NORTH")
    beefy_robot.left
    assert_equal beefy_robot.direction, "WEST"
    beefy_robot.left
    assert_equal beefy_robot.direction, "SOUTH"
    beefy_robot.left
    assert_equal beefy_robot.direction, "EAST"
    beefy_robot.left
    assert_equal beefy_robot.direction, "NORTH"
  end

  def test_can_report_position
    beefy_robot.place(0,0,"NORTH")
    assert_equal beefy_robot.report, "0,0,NORTH"
  end

  def test_can_report_invalid_position
    beefy_robot.place(6,6,"NORTH")
    assert_equal beefy_robot.report, "Beefy Robot is not on the Board"
  end

  def test_example_placement_one
    beefy_robot.place(0,0,"NORTH")
    beefy_robot.move
    assert_equal beefy_robot.report, "0,1,NORTH"
  end

  def test_example_placement_two
    beefy_robot.place(0,0,"NORTH")
    beefy_robot.left
    assert_equal beefy_robot.report, "0,0,WEST"
  end

  def test_example_placement_three
    beefy_robot.place(1,2,"EAST")
    beefy_robot.move
    beefy_robot.move
    beefy_robot.left
    beefy_robot.move
    assert_equal beefy_robot.report, "3,3,NORTH"
  end
end
