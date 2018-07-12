require "pry"

class CLI

  attr_accessor :user, :input

  def self.call
    # binding.pry
    welcome
    find_or_create_user
    return_selection
    #view_performances
    # view_artists

    #self.find_or_create_user
  #  self.return_selection

    # find_or_create_user

  end

  def self.welcome
    puts "Welcome to Festival Planner!"
  end

  def self.find_or_create_user
    puts "Please enter your full name"
    user_name = gets.chomp
    @user = User.find_or_create_by(name: user_name)
    #binding.pry
  end

  def self.return_selection
    input = nil



    until input == 4 do
      puts " "
      list_options
      input = gets.chomp.to_i

      case input
      when 1
        view_artists
      when 2
        view_performances
      when 3
        view_plan
        update_plan
      # when 4
      #   CLI.quit
      end
    end
  end

  def self.view_artists
    # binding.pry
    puts " "
    puts "Artists"
    puts "-------------------"
    Artist.all.each do |artist|
      puts artist.name
    end
    nil
  end

  def self.view_performances
    puts " "
    puts "Performances"
    puts "-----------------------------"
    performances = order_performances_by_time
    performances.each do |performance|
      puts "      #{performance.artist.name}"
      puts "- Stage: #{performance.stage}"
      puts "- #{performance.time}"
      puts "-----------------------------"
    end
    nil
  end

  def self.view_plan
    puts " "
    puts "My Plan:"
    counter = 1
    #plans = @new_user.plans.order(:performance)
    @user.plans.each do |plan|
      puts "#{counter}. #{plan.performance.artist.name} - Stage: #{plan.performance.stage} - #{plan.performance.time} "
      counter+= 1
    end

    nil
  end

  def self.update_plan
    puts ""
    puts "Do you want to edit your plan?"
    puts ""
    puts "Enter 'yes' to edit your plan"
    puts "Enter 'no' to return to options"
    answer1 = gets.chomp
    if answer1 == "yes"
      puts ""
      puts "To add a plan enter 'add'"
      puts "To delete a plan enter 'delete'"
      answer2 = gets.chomp
      if answer2 == "add"
        add_plan
      elsif answer2 == "delete"
        delete_plan
      else
        puts ""
        puts "invalid input"
        update_plan
      end
    elsif answer1 == "no"
      list_options
    else
      puts ""
      puts "invalid input"
      update_plan
    end
  end

  def self.add_plan
    puts ""
    view_performances
    puts ""
    puts "Enter the name of the artist you want to see: "
    answer = gets.chomp
    performance = Performance.all.select {|performance| performance.artist.name == answer}
    Plan.create(user_id: @user.id, performance_id: performance[0].id)

  end

  def self.delete_plan
    puts "deleted"
  end

  def self.quit
    puts "System close"
  end

  #HELPER METHODS
  def self.list_options
    puts "Options:"
    puts "-Enter '1' to View Artists"
    puts "-Enter '2' to View Performances"
    puts "-Enter '3' to View Your Plan"
    puts "-Enter '4' to quit"
  end

  def self.order_performances_by_time
    Performance.all.order(:time)
  end
end
