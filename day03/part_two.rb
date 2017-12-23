# 
#
# --- Part Two ---

# As a stress test on the system, the programs here clear the grid and then store the value 1 in square 1. Then, in the same allocation order as shown above, they store the sum of the values in all adjacent squares, including diagonals.

# So, the first few squares' values are chosen as follows:

# Square 1 starts with the value 1.
# Square 2 has only one adjacent filled square (with value 1), so it also stores 1.
# Square 3 has both of the above squares as neighbors and stores the sum of their values, 2.
# Square 4 has all three of the aforementioned squares as neighbors and stores the sum of their values, 4.
# Square 5 only has the first and fourth squares as neighbors, so it gets the value 5.
# Once a square is written, its value does not change. Therefore, the first few squares would receive the following values:

# 147  142  133  122   59
# 304    5    4    2   57
# 330   10    1    1   54
# 351   11   23   25   26
# 362  747  806--->   ...
# What is the first value written that is larger than your puzzle input?

# Your puzzle input is still 347991.

class Builder
  attr_accessor :grid
  attr_reader :start

  def initialize
    @start = [0,0]
    @grid = Grid.new
  end

  def build
    current = Cell.new(start[0], start[1], grid)
    grid.cells << current
  end
end

class Grid
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def any_cell_bigger?(value)
    cells.map(&:value).sort.last > value
  end

  def value(coordinates)
    if (cell = cell(coordinates))
      cell.value
    else
      0
    end
  end

  def cell(coordinates)
    x = coordinates[0]
    y = coordinates[1]

    cell.select { |cell|
      cell.x == x && cell.y == y
    }
  end

  def print
  end
end

class Cell
  attr_reader :x, :y, :value

  def initialize(x, y, grid)
    @x = x
    @y = y
    @grid = grid

    calculate_value
  end

  def calculate_value
    if grid.cells.empty?
      @value = 1
    else
      @value = sum_neighbors
    end
  end

  def sum_neighbors
    neighbor_coordinates.map { |co|
      grid.value(co)
    }.inject(:+)
  end

  def neighbor_coordinates
    [
      [x, y + 1],
      [x, y - 1],
      [x - 1, y],
      [x + 1, y],
    ]
  end

  private

  attr_reader :grid
end

grid = Grid.new
cell = Cell.new(0, 0, grid)

require 'pry'; binding.pry
