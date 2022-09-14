require 'spec-helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new("Label")
  end

  context 'when creating the classroom class' do
    it 'creates a classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end
end