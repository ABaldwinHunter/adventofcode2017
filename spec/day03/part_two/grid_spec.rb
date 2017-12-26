require_relative "../../spec_helper.rb"
require_relative "../../../lib/day03/part_two/grid.rb"

describe Grid do
  describe "#initialize" do
    it "initializes with an empty array of cells" do
      grid = Grid.new

      expect(grid.cells).to eq([])
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
