require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Label')
  end

  context 'when creating the classroom class' do
    it 'creates a classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'adds student to classroom' do
      @classroom.add_student('new student')
      expect(@classroom.students).not_to be_empty
    end
  end
end
