require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission, name)
    super(age, parent_permission, name)
    @classroom = 'None'
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
