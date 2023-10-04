require_relative 'nameable'

class Person < Nameable
  # getters and setters
  attr_accessor :name, :age
  attr_reader :id

  # constructor
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # methods
  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
