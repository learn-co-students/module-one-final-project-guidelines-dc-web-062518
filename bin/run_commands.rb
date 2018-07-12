def welcome_user(user)
  puts "Welcome, #{user.name}!"
end

def get_command
  puts "What would you like to do now? (Please, type in your command below)"
  command = gets.chomp
end

def help_method
  puts "Here are some commands you can type into our app:"
  puts "'my list' - to see you your reading list."
  puts "'all books' - to see all the books in our database."
  puts "'add to list' - to add a book to your reading list."
  puts "'logout' - to log out of the app."
  puts "'help' - to see the list of commands again."
  get_command
end

def invalid_command(user)
  puts "Sorry, I don't recognize that command."
  execute_command(help_method, user)
end

def execute_command(command, user)
  if command == "add to list"
    add_to_list_command(user)
  elsif command == "logout"
    puts "Thanks for visiting Philo. Happy reading!"
  elsif command == "help"
    execute_command(help_method, user)
  elsif command == "my list"

  elsif command == "all books"

  else
    invalid_command(user)
  end
end

# def book_found?(id)
#   Book.all.each do |book|
#     if book.id.to_s == id
#       return true
#     end
#   end
#   false
# end


def add_to_list_command(user)
  puts "Which book would you like to add?"
  puts "(Please type in the book number. If you'd like to see the book database, type 'all books')"
  input = gets.chomp
  # book = Book.find(book_id)
  if input == "all books"
    execute_command("all books", user)
  elsif Book.exists?(input) == false
  # elsif book_found?(input) == false
    puts "We're sorry, we couldn't find a book with that number."
    execute_command("add to list", user)
  elsif Book.exists?(input) == true
  # elsif book_found?(input) == true
    book = Book.find(input)
    if user.books.include?(book)
      puts "This book is already in your list!"
    else
      user.add_to_book_choices(input)
      puts "Great! #{book.title} by #{book.author} has been added to your list."
    end
    execute_command(get_command, user)
  else
    invalid_command(user)
  end
end
