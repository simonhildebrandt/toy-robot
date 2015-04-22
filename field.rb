class Field
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
    @location = [x, y]
    @direction = direction
  end

  def report
    @location + [@direction] if @placed
  end
end
