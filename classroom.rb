class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize
    @label = label
    @students = []
  end

  def add_students(student)
    @students << student
    student.Classroom = self
  end
end
