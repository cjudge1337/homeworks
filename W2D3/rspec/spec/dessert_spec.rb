require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cake", 5, chef) }
  subject (:dessert2) { Dessert.new("cake", 2, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "five", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("flour")
    end

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to eq(["flour"])
    end
  end

  describe "#mix!" do
    before(:each) do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("chocolate")
      dessert.add_ingredient("milk")
      dessert.mix!
    end

    it "shuffles the ingredient array" do
      expect(dessert.ingredients).not_to eql(["flour", "eggs", "chocolate"])
    end

  end

  describe "#eat" do
    before(:each) do
      dessert.eat(3)
    end

    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert2.eat(3) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      dessert.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
