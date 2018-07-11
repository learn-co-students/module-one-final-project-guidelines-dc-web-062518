require_relative '../config/environment'

puts "Welcome to Philo! To get started, please enter your name here:"
name = gets.chomp
user = User.find_or_create_by(name: name)

  def welcome_user(user)
    puts "Welcome, #{user.name}!"
  end

welcome_user(user)

  def help_method
    puts "Here are some things you can do with our app:"
    puts "Typing in 'list' will show you your reading list."
    puts "Typing in 'books' will show you all the books in our database."
    puts "Typing in 'add to list' will let you add a book to your reading list."
    puts "What would you like to do? (Please, type in your command below)"
  end

help_method

command = gets.chomp

  def execute_command(command, user)
    if command == "add to list"
      puts "Which book would you like to add?"
      puts "(Please type in the book number)"
      book_id = gets.chomp
      user.add_to_book_choices(book_id)
      book = Book.find_by(book_id)
      puts "Great! #{book.title} has been added to your list"
    end
  end

execute_command(command, user)


Pry.start
