class Game
  attr_accessor :user_choice
  def initialize
    @user_count = 0
    @computer_count = 0
    @game_length = [1, 3, 5]
    @valid_options = %w[rock paper scissors]
    print "\nWelcome! This is rock/paper/scissors game."
    puts "You can choose to play to 5, 3 or 1 point. What is your choice?(5, 3 or 1)\n"
  end

  def input
    loop do
      print "\nI choose: "
      @user_choice = gets.chomp.to_i
      unless @game_length.include?(@user_choice)
        print "This is not valid choice! Please choose from 5, 3 or 1\n"
      end
      break if @game_length.include?(@user_choice)
    end
    game
  end

  def game
    output if @user_count == @user_choice || @computer_count == @user_choice
    puts "\nOK, lets start. You are playing against computer. Game ends when you reach #{@user_choice} points"
    loop do
      puts "\nScore is now - You: #{@user_count} - #{@computer_count} :Computer"
      puts "\nChoose your option - rock, paper or scissors (or 'quit' if you want to leave the game)"
      @computer_option = @valid_options.values_at(rand(3))[0]
      print "\nI select: "
      @option = gets.chomp
      puts "Computer chose #{@computer_option}"
      game_statement
    end
  end

  def game_statement
    case [@option, @computer_option]
    when %w[scissors paper]
      puts 'You win this round!'
      @user_count += 1
    when %w[paper rock]
    	puts 'You win this round!'
      @user_count += 1
    when %w[rock scissors]
    	puts 'You win this round!'
      @user_count += 1
    when %w[rock rock]
      puts 'Draw! Noone gets points!'
    when %w[paper paper]
    	puts 'Draw! Noone gets points!'
    when %w[scissors scissors]
    	puts 'Draw! Noone gets points!'
    when %w[rock paper]
      puts 'Computer wins this round!'
      @computer_count += 1
    when %w[paper scissors]
    	puts 'Computer wins this round!'
      @computer_count += 1
    when  %w[scissors rock]
    	puts 'Computer wins this round!'
      @computer_count += 1
    when ['quit', @computer_option] then output
    else
      puts 'Invalid option. Please choose from: rock / paper / scissors'
    end
    game
  end

  def output
    if @user_count == @user_choice
      puts "\nYou are the winner!"
    elsif @computer_count == @user_choice
      puts "\nComputer won this time..."
    else
      puts 'Thanks for playing! See you later!'
    end
    exit
  end
end

user = Game.new
user.input
