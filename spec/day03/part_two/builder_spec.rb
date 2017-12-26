require_relative "../../spec_helper.rb"
require_relative "../../../lib/day03/part_two/builder.rb"

describe Builder do
  describe "#initialize" do
    it "instantiates a new grid object" do
      builder = Builder.new(9)

      expect(builder.grid).to be_a Grid
    end
  end

  describe "#build" do
  end
end
