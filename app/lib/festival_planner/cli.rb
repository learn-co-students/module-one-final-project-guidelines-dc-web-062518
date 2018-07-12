require "pry"

class CLI

  attr_accessor :user, :input

  def self.call
    # binding.pry
    welcome
    find_or_create_user
    select_option

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

  def self.select_option
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
      end
    end
  end

  def self.view_artists
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
    #plans = @user.plans.each do |plan|
    #  plan.order(time: :asc)
    #end
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
    if answer1.downcase == "yes"
      puts ""
      puts "To add a plan enter 'add'"
      puts "To delete a plan enter 'delete'"
      answer2 = gets.chomp
      if answer2.downcase == "add"
        add_plan
      elsif answer2.downcase == "delete"
        delete_plan
      else
        puts ""
        puts "invalid input"
        update_plan
      end
    elsif answer1.downcase == "no"
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
    performance = Performance.all.select {|performance| performance.artist.name.downcase == answer.downcase}
    if performance == []
      puts ""
      puts "invalid input"
      add_plan
    else
      if Plan.find_by(user_id: @user.id, performance_id: performance[0].id).persisted?
          puts ""
          puts "You already have this plan"
      else
        plan = Plan.create(user_id: @user.id, performance_id: performance[0].id)
        @user.plans << plan
        puts ""
        puts "Your plan to see #{answer} has been added"
      end
    end
    view_plan
  end

  def self.delete_plan
    puts ""
    view_plan
    puts ""
    puts "Enter the name of the artist you want to delete:"
    answer = gets.chomp
    plan = @user.plans.select {|plan| plan.performance.artist.name.downcase == answer.downcase}
    if plan == []
      puts ""
      puts "invalid input"
    else
      @user.plans.destroy(plan[0].id)
      puts ""
      puts "Your plan to see #{answer} has been deleted"
    end

    view_plan
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
