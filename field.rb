class Field
  WIDTH = HEIGHT = 5
  MOVES = {
    'NORTH' => [0, 1],
    'EAST' => [1, 0],
    'SOUTH' => [0, -1],
    'WEST' => [-1, 0],
  }

  def place(x, y, direction)
    if position!(x, y, direction)
      @placed = true
    end
  end

  def move
    return unless placed?

    delta_x, delta_y = MOVES[@direction]
    position!(current_x + delta_x, current_y + delta_y)
  end

  def current_x
    @location[0]
  end

  def current_y
    @location[1]
  end

  def turn(direction)
    return unless placed?
    offset = direction == :left ? -1 : 1
    new_direction = directions[directions.index(@direction) + offset]
    position!(current_x, current_y, new_direction)
  end

  def directions
    MOVES.keys
  end

  def placed?
    @placed
  end

  def position!(x, y, direction=nil)
    direction ||= @direction
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

  def report
    @location + [@direction] if placed?
  end
end
