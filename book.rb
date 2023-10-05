class Book
  # setter and getter
  attr_accesor :title, :author, :rentals

  # constructor
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # methods
  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
