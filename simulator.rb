require_relative 'beefy_robot'

class Simulator
  attr_reader :beefy_robot
  DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

  def initialize
    @beefy_robot = BeefyRobot.new
  end

  def evaluate(input)
    commands = ["PLACE", "MOVE", "RIGHT", "LEFT", "REPORT"]
    command = input.upcase.delete("\r|\n")
    command_split = command.split(" ")

    case command_split[0]
    when "PLACE"
      if command_split[0].eql?(commands[0]) && command_split.count > 1
        command_args = command_split[1].split(/,/).reject(&:empty?)
        if command_args.count > 2
          @x = command_args[0].to_i
          @y = command_args[1].to_i
          @face = command_args[2]
          if DIRECTIONS.include?(@face)
            beefy_robot.place(@x, @y, @face)
          else
            "INVALID COMMAND"
          end
        else
          "INVALID COMMAND"
        end
      else
        "INVALID COMMAND"
      end
    when "MOVE"
      beefy_robot.move
    when "RIGHT"
      beefy_robot.right
    when "LEFT"
      beefy_robot.left
    when "REPORT"
      beefy_robot.report
    else
      "INVALID COMMAND"
    end
  end
end
