require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def assign_classroom=(classroom)
    @classroom = classroom
    classroom.add_students(self) unless classroom.students.includes?(self)
  end
end

student1 = Student.new(28, "class_5", "Emem")
p student1
p student1.play_hooky
