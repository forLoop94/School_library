require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = Time.new.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_book(rental)
    @rentals << rental unless @rentals.includes?(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
