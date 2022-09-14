require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(24)
  end

  context 'when testing the person class' do
    it 'creates an instance of the person class' do
      expect(@person).to be_an_instance_of Person
    end
  end
end
