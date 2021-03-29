require_relative 'beefy_robot'

class Simulator
  def initialize
    @beefy_robot = BeefyRobot.new
  end

  # Check if command is valid
  def evaluate(input)

    outcome = true
    if outcome
      self.execute(input)
    end
  end

  # execute command
  def execute(command)
    case command
    when :place
      x = 0
      y = 0
      direction = "NORTH"
      @beefy_robot.place(x, y, direction)
    when :move
      @beefy_robot.move
    when :left
      @beefy_robot.left
    when :right
      @beefy_robot.right
    when :report
      @beefy_robot.report
    end
  end
end
