require_relative "./cell.rb"

class Grid
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def value(coordinates)
    if (cell = cell(coordinates))
      cell.value
    else
      0
    end
  end

  private

  def cell(coordinates)
    x = coordinates[0]
    y = coordinates[1]

    cell = cells.find { |cell| cell.x == x && cell.y == y }
    puts "found cell: #{cell.inspect}" if cell
    cell
  end
end
