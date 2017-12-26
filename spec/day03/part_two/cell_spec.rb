require_relative "../../spec_helper.rb"
require_relative "../../../lib/day03/part_two/cell.rb"

describe Cell do
  describe "#initialize" do
    it "initializes with coordinates and a grid" do
      grid = Grid.new

      cell = Cell.new([0,1], grid)

      expect(cell.grid).to eq(grid)
      expect(cell.x).to eq(0)
      expect(cell.y).to eq(1)
      # value defaults to 1 when it's the first cell in grid
      expect(cell.value).to eq(1)
    end
  end

  describe "#value" do
    it "defaults to 1 when the grid has no other cells" do
      grid = Grid.new

      cell = Cell.new([0,1], grid)

      expect(cell.value).to eq(1)
    end

    it "sums neighbor cells at time of creation" do
      grid = Grid.new
      cell = Cell.new([0,0], grid) # val = 1
      grid.cells << cell

      cell_two = Cell.new([1,0], grid) # val = 1
      grid.cells << cell_two

      cell_three = Cell.new([1,1], grid) # val = 2
      grid.cells << cell_three

      cell_four = Cell.new([0,1], grid) # val = 4
      grid.cells << cell_four

      cell_five = Cell.new([-1, 1], grid) # val = 5
      grid.cells << cell_five

      cell_six = Cell.new([-1, 0], grid) # val = 10
      grid.cells << cell_six

      cell_seven = Cell.new([-1, -1], grid) # val = 11
      grid.cells << cell_seven

      cell_eight = Cell.new([0, -1], grid) # val = 23
      grid.cells << cell_eight

      cell_nine = Cell.new([1, -1], grid) # val = 25
      grid.cells << cell_nine
  
      expect(cell.value).to eq(1)
      expect(cell_two.value).to eq(1)
      expect(cell_three.value).to eq(2)
      expect(cell_four.value).to eq(4)
      expect(cell_five.value).to eq(5)
      expect(cell_six.value).to eq(10)
      expect(cell_seven.value).to eq(11)
      expect(cell_eight.value).to eq(23)
      expect(cell_nine.value).to eq(25)
    end
  end

  describe "#cells" do
    it "accepts new cells" do
      grid = Grid.new
      grid.cells << Cell.new([0, 0], grid)

      expect(grid.cells.length).to eq(1)
    end
  end

  describe "#value" do
    describe "when the cell exists" do
      it "returns the value of a set of coordinates" do
        grid = Grid.new
        grid.cells << Cell.new([0, 0], grid)

        expect(grid.value([0,0])).to eq(1)
      end
    end

    describe "when the grid has no cell at those coorindates" do
      it "returns 0" do
        grid = Grid.new

        expect(grid.value([10, 4])).to eq(0)
      end
    end
  end
end
