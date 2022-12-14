require './nameable'
class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission, :id

  def initialize(age, parent_permission, name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  # private :of_age?
end
