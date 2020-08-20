require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "ZZ") }

  subject(:d) {Dessert.new("cake",300,chef)}
  describe "#initialize" do
    it "sets a type" do
      expect(d.type).to eq("cake")
    end

    it "sets a quantity" do 
      expect(d.quantity).to eq(300)
    end

    it "starts ingredients as an empty array" do
      expect(d.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      # subject(:d) {Dessert.new("cake","3",chef)} 
      expect {Dessert.new("cake","3",chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(d.ingredients).to be_empty
      d.add_ingredient("ingredient")
      expect(d.ingredients).to include("ingredient")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      # expect(d.ingredients).to include("ingredient")
      d.add_ingredient("a")
      d.add_ingredient("b")
      d.add_ingredient("c")
      d.add_ingredient("d")
      d.add_ingredient("e")
      d.mix!
      expect(d.ingredients[0]).to_not eq("ingredient")
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(d.quantity).to eq(300)
      d.eat(20)
      expect(d.quantity).to eq(280)
    end
      
    it "raises an error if the amount is greater than the quantity" do
      expect {d.eat(400)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef zz the Great Baker")
      expect(d.serve).to eq("Chef zz the Great Baker has made 300 cakes!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(d)
      d.make_more
    end
  end
end
