require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name)
    super(age, parent_permission, name)
    @specialization = specialization
    @parent_permission = 'true'
  end

  def can_use_services?
    true
  end
end
