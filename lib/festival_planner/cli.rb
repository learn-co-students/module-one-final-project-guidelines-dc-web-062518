class CLI

def welcome
  puts "Welcome to Festival Planner!"
end

def find_or_create_user
  puts "Please enter your full name"
  user_name = gets.chomp
  new_user = User.find_or_create_by(name: user_name)
  #binding.pry
end

def list_options
  puts "Options:"
  puts "-Enter '1' to View Artists"
  puts "-Enter '2' to View Performances"
  puts "-Enter '3' to View Your Plan"
  puts "-Enter '4' to quit"
  input = gets.chomp.to_i

  if input == 1
    puts Artist.all
  elsif input == 2
    puts Performance.all
  end

end

def view_artists
  Artist.all
end

welcome
find_or_create_user
list_options

end
