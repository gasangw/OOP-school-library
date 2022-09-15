require_relative 'spec_helper'

describe Solver do
  before :each do
    @solver = Solver.new
  end

  context "To test the solver class" do
    it "Returns the factorial of the number" do
      expect(@solver.factorial(5)).to eq 120
    end

    it "Reverses the String input" do
      expect(@solver.reverse("abby")).to eq "ybba"
    end

    it "Runs the fizzbuzz algorithm" do
      expect(@solver.fizzbuzz(15)).to eq 'FizzBuzz'
    end
  end
end