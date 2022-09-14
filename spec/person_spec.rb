require_relative 'spec_helper'

describe Person do
  before :each do
    @person1 = Person.new(20)
    @person2 = Person.new(88, 'Abby')
  end

  context 'when testing the person class' do
    it 'creates an instance of the person class' do
      expect(@person1).to be_an_instance_of Person
    end

    it 'allows person to use services' do
      expect(@person1.can_use_services?).to be_truthy
    end

    it 'Is true when person is over 18' do
      expect(@person1.of_age?).to be_truthy
    end

    it 'Returns the correct name' do
      expect(@person2.correct_name).to eq 'Abby'
    end
  end
end
