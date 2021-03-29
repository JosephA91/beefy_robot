class BeefyRobot
  HEIGHT = 5
  WIDTH = 5

  def initialize
    @direction = ["NORTH", "EAST", "SOUTH", "WEST"]
  end

  # TODO: MUST PLACE ROBOT FIRST
  # DISCARD ALL COMMANDS THAT DONT == PLACE

  def place(x, y, face)
    @face = face
    @x = x
    @y = y
    self.set_direction
    self.valid_position?(@x, @y) ? true : false
  end

  def set_direction
    raise ArgumentError, "Error: Direction doesn't exist" unless @direction.include?(@face)
    @direction.rotate! until @direction[0] == @face
  end

  def direction
    @direction[0]
  end

  def right
    @direction.rotate!(1)
    self.valid_position?(@x, @y) ? true : false
  end

  def left
    @direction.rotate!(-1)
    self.valid_position?(@x, @y) ? true : false
  end

  def move
    case direction
    when "NORTH"
      @y += 1
    when "EAST"
      @x += 1
    when "SOUTH"
      @y += -1
    when "WEST"
      @x += -1
    end
    self.valid_position?(@x, @y) ? true : false
  end

  def report
    if self.valid_position?(@x, @y)
      [@x,@y,direction]
    else
      "Beefy Robot is not on the Board"
    end
  end

  private

  def valid_position?(x, y)
    x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT
  end
end
