class BeefyRobot
  HEIGHT = 5
  WIDTH = 5

  def initialize
    @direction = ["NORTH", "EAST", "SOUTH", "WEST"]
    @robots_collection = Array.new
  end

  def place(x, y, face)
    unless @robots_collection.include?(self.current_position(x,y))
      @face = face
      @x = x
      @y = y
      @initial_position = { x: @x, y: @y, face: @face }
      self.set_direction
    end
  end

  def place_object
    unless @initial_position.nil?
      next_move = self.current_position(@x,@y)
      case next_move[:face]
      when "NORTH"
        next_move[:y] += 1
      when "EAST"
        next_move[:x] += 1
      when "SOUTH"
        next_move[:y] += -1
      when "WEST"
        next_move[:x] += -1
      end
      @robots_collection << next_move unless @robots_collection.include?(next_move)
    end
  end

  def robots_collection
    @robots_collection
  end

  def current_position(x,y)
    @position = { x: x, y: y, face: direction }
  end

  def set_direction
    raise ArgumentError, "Error: Direction doesn't exist" unless @direction.include?(@face)
    @direction.rotate! until @direction[0] == @face
  end

  def direction
    @direction[0]
  end

  def right
    @direction.rotate!(1) unless @initial_position.nil?
  end

  def left
    @direction.rotate!(-1) unless @initial_position.nil?
  end

  def move
    unless @initial_position.nil?
      case direction
      when "NORTH"
        @y += 1
        if @robots_collection.include?(current_position(@x,@y))
          @y += -1
        end
      when "EAST"
        @x += 1
        if @robots_collection.include?(current_position(@x,@y))
          @x += -1
        end
      when "SOUTH"
        @y += -1
        if @robots_collection.include?(current_position(@x,@y))
          @y += 1
        end
      when "WEST"
        @x += -1
        if @robots_collection.include?(current_position(@x,@y))
          @x += -1
        end
      end
    end
  end

  def report
    if self.valid_position?(@x, @y)
      "#{@x},#{@y},#{direction}"
    else
      "Beefy Robot is not on the Board"
    end unless @initial_position.nil?
  end

  private

  def valid_position?(x, y)
    x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT
  end
end
