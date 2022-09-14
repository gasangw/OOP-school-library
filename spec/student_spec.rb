require_relative 'spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new('Label')
    @student = Student.new(22, @classroom)
  end

  context 'When testing the student class' do
    it 'Should create an instance of the class' do
      expect(@student).to be_an_instance_of Student
    end
  end
end
