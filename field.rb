class Field
  WIDTH = HEIGHT = 5
  MOVES = {
    'NORTH' => [0, 1],
    'EAST' => [1, 0],
    'SOUTH' => [0, -1],
    'WEST' => [-1, 0],
  }

  def place(x, y, direction)
    if position!(x: x, y: y, direction: direction)
      @placed = true
    end
  end

  def move
    return unless placed?

    delta_x, delta_y = MOVES[@direction]
    position!(x: current_x + delta_x, y: current_y + delta_y)
  end

  def current_x
    @location[0]
  end

  def current_y
    @location[1]
  end

  def current_direction
    @direction
  end

  def turn(direction)
    return unless placed?
    offset = direction == :left ? -1 : 1
    position!(direction: offset_direction(offset))
  end

  def placed?
    @placed
  end

  def report
    @location + [current_direction] if placed?
  end

  private
  
  def offset_direction(offset)
    directions[directions.index(current_direction) + offset]
  end

  def directions
    MOVES.keys
  end

  def position!(options)
    x = options[:x] || current_x
    y = options[:y] || current_y
    direction = options[:direction] || current_direction
    return unless valid_position?(x, y) and valid_direction?(direction)
    @location = [x, y]
    @direction = direction
  end

  def valid_position?(x, y)
    x >= 0 and x < WIDTH and y >= 0 and y < HEIGHT
  end

  def valid_direction?(direction)
    MOVES.keys.include? direction
  end
end
