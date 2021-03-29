require_relative 'beefy_robot'

class Simulator
  attr_reader :beefy_robot

  def initialize
    @beefy_robot = BeefyRobot.new
  end

  # Check if command is valid
  # If true pass input to execute
  # NOT VALID IF: simulator.evaluate("REPORT  0,0,NORTH")

  def evaluate(input)
    commands = ["PLACE", "MOVE", "RIGHT", "LEFT", "REPORT"]
    str = input.delete("\r|\n")
    command_array = str.split(" ")

    if commands.include?( command_array[0])
      command = command_array[0].downcase.to_sym
      if command_array[0].eql?(commands[0])
        command_args = command_array[1].split(/,/)
        @x = command_args[0].to_i
        @y = command_args[1].to_i
        @direction = command_args[2]
      end
      self.execute(command)
    else
      raise ArgumentError, 'Invalid command'
    end
  end

  def execute(command)
    case command
    when :place
      beefy_robot.place(@x, @y, @direction)
    when :move
      beefy_robot.move
    when :right
      beefy_robot.right
    when :left
      beefy_robot.left
    when :report
      beefy_robot.report
    end
  end
end
