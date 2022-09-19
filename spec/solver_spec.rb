require_relative 'spec_helper'

describe Solver do
  before :each do
    @solver = Solver.new
  end

  context 'To test the solver class' do
    it 'Returns the factorial of the number' do
      expect(@solver.factorial(5)).to eq 120
      expect(@solver.factorial(0)).to eq 1
      expect(@solver.factorial(1)).to eq 1
    end

    it 'should raise an argument error if the number is negative' do
      expect(@solver.factorial(-10)).to raise_error(ArgumentError)
    end

    it 'Reverses the String input' do
      expect(@solver.reverse('abby')).to eq 'ybba'
    end

    it 'Runs the fizzbuzz algorithm' do
      expect(@solver.fizzbuzz(15)).to eq 'FizzBuzz'
      expect(@solver.fizzbuzz(3)).to eq 'Fizz'
      expect(@solver.fizzbuzz(10)).to eq 'Buzz'
      expect(@solver.fizzbuzz(7)).to eq '7'
    end
  end
end
