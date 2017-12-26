class Cell
  attr_reader :x, :y, :grid

  def initialize(coordinates, grid)
    @x = coordinates[0]
    @y = coordinates[1]
    @grid = grid

    value
  end

  def value
    @value ||= calculate_value
  end

  def sum_neighbors
    neighbor_coordinates.map { |co|
      val = grid.value(co)
      puts "val of neighbor at #{co} is: #{val}"
      val
    }.inject(:+)
  end

  def neighbor_coordinates
    [
      [x, y + 1],
      [x, y - 1],
      [x - 1, y],
      [x - 1, y + 1],
      [x - 1, y - 1],
      [x + 1, y],
      [x + 1, y + 1],
      [x + 1, y - 1],
    ]
  end

  private

  def calculate_value
    if grid.cells.empty?
      puts "grid cells empty"
      1
    else
      sum_neighbors
    end
  end
end

