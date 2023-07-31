class Person
  def initialize(name = "Unknown", age, parent_permission: true)
    @id = Time.new.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person_1 = Person.new("alice", 24)
puts person_1.can_use_services?
