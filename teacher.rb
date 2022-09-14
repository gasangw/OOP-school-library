require './person'

class Teacher < Person
  attr_accessor :specialization
  def initialize(specialization, age, name = 'Unknown')
    super(age, name, parent_permission)
    @specialization = specialization
    @parent_permission = 'true'
  end

  def can_use_services?
    true
  end
end
