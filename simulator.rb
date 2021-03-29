require_relative 'beefy_robot'

class Simulator
  def initialize
    @beefy_robot = BeefyRobot.new
  end

  # Check if command is valid
  def evaluate(input)
    puts input
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

simulator = Simulator.new
puts simulator.evaluate("PLACE 0,0,NORTH")
simulator.execute(:place)
simulator.execute(:move)
simulator.execute(:left)
simulator.execute(:move)
simulator.execute(:move)
simulator.execute(:right)
simulator.execute(:move)
print simulator.execute(:report)
