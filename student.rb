class Student < Person
  # getters and setters
  attr_accessor :classroom

  # constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # methods
  def play_hooky
    '¯(ツ)/¯'
  end

  def add_student(classroom)
    classroom.add_student(self) unless classroom.student.include?(self)
  end
end
