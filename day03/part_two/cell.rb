class Cell
  attr_reader :x, :y, :value

  def initialize(coordinates, grid)
    @x = coordinates[0]
    @y = coordinates[1]
    @grid = grid

    calculate_value
    grid.cells << self
  end

  def calculate_value
    if grid.cells.empty?
      puts "grid cells empty"
      @value = 1
    else
      @value = sum_neighbors
    end
  end

  def sum_neighbors
    neighbor_coordinates.map { |co|
      val = grid.value(co)
      puts "val of neighbor is: #{val}"
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

  attr_reader :grid
end

