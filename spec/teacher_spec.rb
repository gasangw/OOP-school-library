require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(45, 'Science Education')
  end

  context 'When testing the Teacher class' do
    it 'Creates an instance of the teacher class' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'should allow the teacher to use services' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
