class Classroom
  # getters and setters
  attr_accessor :label, :student

  # constructor
  def initialize(label)
    @label = label
    @student = []
  end

  # methods
  def add_student(student)
    @student << student unless @student.include?(student)
    student.classroom = self
  end

  def remove_student(student)
    @student.delete(student)
    student.classroom = nil
  end
end
