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

  end

  def turn

  end

  def position!(x, y, direction)
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
    @location + [@direction] if @placed
  end
end
