require_relative "./grid.rb"
require_relative "./cell.rb"
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
  # builds a spiral grid following puzzle
  NORTH = [0, 1]
  SOUTH = [0, -1]
  EAST = [1, 0]
  WEST = [-1, 0]
  
  attr_accessor :grid, :current_cell, :current_direction, :current_coordinates

  def initialize(num)
    @grid = Grid.new
    @current_coordinates = [0, 0]
    @current_direction = SOUTH
    @stopping = num

    add_cell
    print_progress
  end

  def build
    while current_cell.value < stopping
      move
      add_cell
      print_progress
    end

    puts "*"*80
    puts "Done!"
  end

  def move
    if at_corner?
      puts "*"*900
      change_direction
    end

    step_forward
  end

  private

  attr_reader :stopping

  def print_progress
    puts "number of cells is #{grid.cells.count}"
    puts "current coordinates are #{current_coordinates}"
    puts "current value of cell is #{current_cell.value}"
    puts "grid cells:\n"
    puts grid.cells.inspect
  end

  def add_cell
    @current_cell = Cell.new(current_coordinates, grid)
    grid.cells << @current_cell
  end

  def step_forward
    current_coordinates[0] += current_direction[0]
    current_coordinates[1] += current_direction[1]
  end

  def change_direction
    puts "changing direction!"
    puts "old = #{current_direction}"
    @current_direction = next_counter_clockwise
    puts "new = #{current_direction}"
  end

    def next_counter_clockwise
      {
        EAST => NORTH,
        NORTH => WEST,
        WEST => SOUTH,
        SOUTH => EAST,
      }.fetch(current_direction)
    end

  def at_corner?(num = position)
    puts "position is #{num}"
    puts "corners in current ring: #{corners_in_current_ring(num)}"
    (corners_in_current_ring(num).include? num) || num == 2
  end


  def position
    grid.cells.count
  end

  def corners_in_current_ring(num)
    return [1] if num == 1

    # smallest_bigger_square_root
    root = Math.sqrt(num).ceil

    if root % 2 == 0
      # must be nearest odd square root ring
      root += 1
    end

    square = root**2

    corners = [
      square - (root - 1),
      square - (root - 1) * 2,
      square - (root - 1) * 3,
      # we actually turn at 1 _after_ the corner of a square ring at perfect square
      # corner
      square - (root - 1) * 4 + 1,
    ]
  end
end

builder = Builder.new(40)

require 'pry'; binding.pry
