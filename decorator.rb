require './nameable'
class Decorator < Nameable
  def initialize(nameable_object)
    @nameable_object = nameable_object
    super()
  end
  attr_reader :nameable_object
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable_object.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable_object.correct_name[0, 10]
  end
end
