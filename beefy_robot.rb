class BeefyRobot
  HEIGHT = 5
  WIDTH = 5

  def initialize
    @direction = ["NORTH", "EAST", "SOUTH", "WEST"]
  end

  # TODO: MUST PLACE ROBOT FIRST
  # DISCARD ALL COMMANDS THAT DONT == PLACE
  # Fix issue if off table skip

  def place(x, y, face)
    @face = face
    @x = x
    @y = y
    # raise error if x or y nor Integer

    if self.valid_position?(@x, @y)
      self.set_direction
      true
    else
      false
    end
  end

  def set_direction
    raise ArgumentError, "Error: Direction doesn't exist" unless @direction.include?(@face)
    @direction.rotate! until @direction[0] == @face
  end

  def direction
    @direction[0]
  end

  def right
    if self.valid_position?(@x, @y)
      @direction.rotate!(1)
      true
    else
      false
    end
  end

  def left
    if self.valid_position?(@x, @y)
      @direction.rotate!(-1)
      true
    else
      false
    end
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
    end if self.valid_position?(@x, @y) ? true : false
  end

  def report
    if self.valid_position?(@x, @y)
      [@x,@y,direction]
    end
  end

  private

  def valid_position?(x, y)
    x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT
  end
end
