class Student < Person
  # constructor
  def initialize(classroom)
    super(id, age, name, parent_permission: true)
    @classroom = classroom
  end

  # methods
  def play_hooky
    '¯(ツ)/¯'
  end
end
