require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = "Unknown", age, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher_1 = Teacher.new("alice", 2)
p teacher_1.can_use_services?
