require_relative 'simulator'

steps = [
  "# STEP 1: To place Beefy use: PLACE X,Y,NORTH|SOUTH|EAST|WEST",
  "# Example: PLACE 0,0,NORTH",
  "# Step 2: To Drive Beefy use either: MOVE, RIGHT, LEFT or REPORT",
  "# Step 3: To exit use: QUIT",
]

simulator = Simulator.new
puts "# Welcome to the Beefy Robot Game"
puts "# Instructions below..."
puts ""
steps.each do |step|
  puts step
end

command = gets.chomp

while command
  command.strip!
  if command.downcase.eql?("quit")
    puts "# Thank you for playing with Beefy"
    exit
  elsif command.downcase.eql?("move") or command.downcase.eql?("left") or command.downcase.eql?("right")
    simulator.evaluate(command)
    puts ""
    command = gets.chomp
  else
    feedback = simulator.evaluate(command)
    print feedback if feedback
    puts ""
    command = gets.chomp
  end
end
