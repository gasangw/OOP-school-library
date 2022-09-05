require './person'

class Student < Person
  def initialize(classroom = 'Unknown')
    super()
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
