require 'date'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end

  def display_menu
    puts '***********************************************'
    puts 'Welcome to School Library App!'
    puts 'Please select an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - Exit'
    puts '***********************************************'
  end

  def handle_choice(choice)
    case choice
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 then exit_program
    else
      puts 'Please select a valid option'
    end
  end

  def exit_program
    puts 'Thanks for using the School Library App!'
    puts 'made by Karim Barragan, 2023'
    sleep 1
    exit
  end

  def list_books
    if @books.empty?
      (puts 'No books available')
    else
      (puts 'Books:'
       @books.each do |book|
         puts "#{book.title} by #{book.author} with id #{book.id}"
       end)
    end
  end

  def list_people
    if @people.empty?
      (puts 'No people available')
    else
      (puts 'People:'
       @people.each do |person|
         puts "#{person.name} age: #{person.age} (#{person.class}) with id #{person.id}"
       end)
    end
  end

  def create_person
    puts 'Create a person:'
    puts '1. Student'
    puts '2. Teacher'

    choice = gets.chomp.to_i

    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice'
    end
  end

  def create_student
    puts 'Enter student name:'
    name = gets.chomp

    puts 'Enter student age:'
    age = gets.chomp.to_i

    puts 'Does the student have parent permission? (Y/N)'
    parent_permission = gets.chomp.upcase

    student = Student.new(age, name, parent_permission: parent_permission == 'Y')

    puts "Created student #{student.name} with id #{student.id}"
    @people << student
  end

  def create_teacher
    puts 'Enter teacher name:'
    name = gets.chomp

    puts 'Enter teacher age:'
    age = gets.chomp.to_i

    puts 'Enter teacher specialization:'
    gets.chomp

    teacher = Teacher.new(age, name)

    puts "Created teacher #{teacher.name} with id #{teacher.id}"
    @people << teacher
  end

  def create_book
    puts 'Enter book title:'
    title = gets.chomp

    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)

    puts "Created book #{book.title} by #{book.author} with id #{book.id}"
    @books << book
  end

  def create_rental
    list_people
    puts 'Enter person id:'
    person_id = gets.chomp.to_i

    list_books
    puts 'Enter book id:'
    book_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.id == book_id }

    if person.nil?
      puts "Person with id #{person_id} not found"
    elsif book.nil?
      puts "Book with id #{book_id} not found"
    else
      rental = Rental.new(Date.today.strftime('%Y-%m-%d'), person, book)

      puts "Created rental #{rental.person.name} - #{rental.book.title} - date: #{rental.date}"
      @rentals << rental
    end
  end

  def list_rentals
    list_people
    puts 'Enter person id:'
    person_id = gets.chomp.to_i

    if (person = @people.find { |p| p.id == person_id })
      puts "Rentals for #{person.name}:"
      rentals = @rentals.select { |r| r.person == person }
      if rentals.empty?
        (puts 'No rentals found')
      else
        rentals.each do |rental|
          puts "#{rental.book.title} by #{rental.book.author} on #{rental.date}"
        end
      end
    else
      puts "Person with id #{person_id} not found"
    end
  end
end

def main
  app = App.new
  app.run
end

main
