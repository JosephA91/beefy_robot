require 'minitest/autorun'
require '../beefy_robot'
require '../simulator'

class SimulatorTest < Minitest::Test
  attr_reader :beefy_robot, :simulator

  def setup
    @beefy_robot = BeefyRobot.new
    @simulator = Simulator.new
  end

  def test_can_evaluate_valid_input
    skip
    assert simulator.evaluate("PLACE 0,0,NORTH")
    assert simulator.evaluate("MOVE")
    assert simulator.evaluate("RIGHT")
    assert simulator.evaluate("LEFT")
    assert simulator.evaluate("REPORT")
  end

  def test_cannot_evaluate_invalid_input
    skip
    refute simulator.evaluate("PLACE")
    refute simulator.evaluate("PLACE 0,0")
    refute simulator.evaluate("PLACE ,,NORTH")
    refute simulator.evaluate("MOOVEE")
    refute simulator.evaluate(:left)
    refute simulator.evaluate("")
    refute simulator.evaluate(" ")
    refute simulator.evaluate(nil)
    refute simulator.evaluate(123)
    refute simulator.evaluate(["PLACE", "0", "0", "NORTH"])
  end

  def test_can_execute_place_command
    skip
    simulator.evaluate("PLACE 0,0,NORTH")
    assert_equal simulator.evaluate("REPORT"), [0,0,"NORTH"]
  end

  def test_can_execute_move_command
    skip
    simulator.evaluate("PLACE 0,0,NORTH")
    simulator.evaluate("MOVE")
    assert_equal simulator.evaluate("REPORT"), [0,1,"NORTH"]
  end

  def test_can_execute_right_command
    skip
    simulator.evaluate("PLACE 0,0,NORTH")
    simulator.evaluate("RIGHT")
    ssert_equal simulator.evaluate("REPORT"), [0,0,"EAST"]
  end

  def test_can_execute_left_command
    skip
    simulator.evaluate("PLACE 0,0,NORTH")
    simulator.evaluate("LEFT")
    assert_equal simulator.evaluate("REPORT"), [0,0,"WEST"]
  end

  def test_can_execute_report_command
    skip
    simulator.evaluate("PLACE 1,1,WEST")
    assert_equal simulator.evaluate("REPORT"), [1,1,"WEST"]
  end

  def test_can_execute_multiple_sequence
    skip
    simulator.evaluate("PLACE 0,0,NORTH")
    simulator.evaluate("RIGHT")
    simulator.evaluate("MOVE")
    simulator.evaluate("MOVE")
    assert_equal simulator.evaluate("REPORT"), [2,0,"EAST"]
  end

  def test_beefy_robot_and_simulator_comparison_one
    skip
    beefy_robot.place(0,0,"NORTH")
    beefy_robot.move
    simulator.evaluate("PLACE 0,0,NORTH")
    simulator.evaluate("MOVE")
    assert_equal beefy_robot.report, simulator.evaluate("REPORT") #[0,1,"NORTH"]
  end

  def test_beefy_robot_and_simulator_comparison_two
    skip
    beefy_robot.place(0,0,"NORTH")
    beefy_robot.left
    simulator.evaluate("PLACE 0,0,NORTH")
    simulator.evaluate("LEFT")
    assert_equal beefy_robot.report, simulator.evaluate("REPORT") #[0,0,"WEST"]
  end

  def test_beefy_robot_and_simulator_comparison_three
    skip
    beefy_robot.place(1,2,"EAST")
    beefy_robot.move
    beefy_robot.move
    beefy_robot.left
    beefy_robot.move
    simulator.evaluate("PLACE 1,2,EAST")
    simulator.evaluate("MOVE")
    simulator.evaluate("MOVE")
    simulator.evaluate("LEFT")
    simulator.evaluate("MOVE")
    assert_equal beefy_robot.report, simulator.evaluate("REPORT") #[3,3,"NORTH"]
  end
end
