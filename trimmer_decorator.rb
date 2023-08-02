require_relative 'base_decorator'
require_relative 'person'

class TrimmerDecorator < Decorator
  def correct_name()
    if super.length <= 10
      super
    else
      super[0..9]
    end
  end
end

person2 = Person.new('maximilianusperulus', 24)
puts person2.correct_name

trimmed_person = TrimmerDecorator.new(person2)
puts trimmed_person.correct_name