# Object Oriented Rock Paper Scissors
# Player given a choice (R, P, S)
# Computer chooses randomly
# The hands are compared to evaluate who wins
# Display results, announcing winner
# OO style: class Player: Human, Computer
# Methods: pick_hand, compare_hands, display

class Player
  attr_accessor :choice
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    case choice
    when 'r'
      rps_choice = "Rock"
    when 'p'
      rps_choice = "Paper"
    when 's'
      rps_choice = "Scissors"
    end
    "#{name} chose #{rps_choice}."
  end
end 

class Human < Player
  def pick_hand
    begin
      puts "Pick one: r for Rock, p for Paper or s for Scissors."
      self.choice = gets.chomp.downcase
    end until Game::CHOICE.keys.include?(choice)  
  end  
end

class Computer < Player
  def pick_hand
    self.choice = Game::CHOICE.keys.sample
  end
end


class Game
  CHOICE = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}

  attr_reader :human_player, :computer_player, :choice, :name

  def initialize
    @human_player = Human.new("You")
    @computer_player = Computer.new("Computer")
  end

  def play
    @human_player.pick_hand
    @computer_player.pick_hand
    puts @human_player
    puts @computer_player
    compare_hands
  end

  def compare_hands
    if @human_player.choice == @computer_player.choice
      puts "It's a tie!"
    # player wins:
    elsif (@human_player.choice == 'r' && @computer_player.choice == 's') || (@human_player.choice == 'p' && @computer_player.choice == 'r') || (@human_player.choice == 's' && @computer_player.choice == 'p')
      display_winning_message(@human_player.choice)
      puts "#{@human_player.name} won!"
    else
      display_winning_message(@computer_player.choice)
      puts "#{@human_player.name} lost!"
    end    
  end

  def display_winning_message(choice)
    case choice
    when 'r'
      puts "Rock smashes scissors."
    when 'p'
      puts "Paper wraps rock."
    when 's'
      puts "Scissors cut paper."
    end
  end  
end

#Main 
begin
  rps = Game.new
  rps.play
  puts "Do you want to play again? (y/n)"
end until gets.chomp.downcase != 'y'