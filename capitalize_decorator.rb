require_relative 'base_decorator'
require_relative 'person'

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

# Try it

person1 = Person.new('alice', 24)
puts person1.correct_name

capitalized_person = CapitalizeDecorator.new(person1)
puts capitalized_person.correct_name