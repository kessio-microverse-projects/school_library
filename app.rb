require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'
require_relative './rental'

class App
  attr_accessor :books, :students, :teachers, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_all_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

  def display_all_people
    @people.each_with_index do |people, index|
      puts "#{index}) Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    person_option = gets.chomp.to_i
    if person_option != 1 && person_option != 2
      puts 'Invalid option, Kindly choose 1 (student) or 2 (teacher)'
      return
    end
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if person_option == 1
      print 'Classroom: '
      classroom_ = gets.chomp
      print 'Has parent permmission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      create_student(name, age, parent_permission, classroom_)
    else
      print 'Specialization: '
      specialization = gets.chomp
      create_teacher(name, age, specialization)
    end
    puts 'Person created successfully'
  end

  def create_student(name, age, parent_permission, classroom_)
    classroom = ClassRoom.new(classroom_)
    student = Student.new(classroom, age, name: name, parent_permission: parent_permission)
    @people << student
  end

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_all_books
    selected_book_option = gets.chomp.to_i
    display_all_people
    selected_person_option = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    book = @books[selected_book_option]
    person = @people[selected_person_option]
    @rentals << Rental.new(date, book, person)
    puts 'Rental created successfully'
  end

  def list_rental_by_id
    print 'Id of person: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end

  def run
    prompt
  end
end
