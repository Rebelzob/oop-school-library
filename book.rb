class Book
  # setter and getter
  attr_accessor :title, :author, :rentals
  attr_reader :id

  # constructor
  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  # methods
  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
