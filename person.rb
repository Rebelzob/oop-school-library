require_relative 'nameable'

class Person < Nameable
  # getters and setters
  attr_accessor :name, :age, :rentals
  attr_reader :id

  # constructor
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end
