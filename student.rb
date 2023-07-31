require_relative 'person'

class Student < Person
  def initialize(classroom, name = "Unknown", age, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student_1 = Student.new("alice", 24)
p student_1.play_hooky