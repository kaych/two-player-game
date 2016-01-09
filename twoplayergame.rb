
def generate_question
  @first_number = rand(1..20)
  @second_number = rand(1..20)
end

def randomize_question(first_number, second_number)
  operator = rand(1..3)
    if operator == 1
      @question = "> What is #{first_number} + #{second_number}?"
      @answer = first_number + second_number
    elsif operator == 2
      @question = "> What is #{first_number} - #{second_number}?"
      @answer = first_number - second_number
    else
      @question = "> What is #{first_number} * #{second_number}?"
      @answer = first_number * second_number
    end
  @question
end

def prompt_player_for_answer(player)
  puts randomize_question(@first_number, @second_number)
  @player_input = gets.chomp.to_i
end

def verify_answer(player) 
  if @answer == @player_input
    player.gain_point
    puts "Correct!".colorize(:green)
  else
    player.lose_life
    puts "Oh no, that's wrong. You lose a life. Sadface.".colorize(:red)
  end
end

def turn(player)
  puts "#{player.name}, it's your turn!".colorize(:light_blue)
  generate_question
  prompt_player_for_answer(player)
  verify_answer(player)
end

def score_report(player1, player2)
  puts "The score is #{player1.name}: #{player1.score} to #{player2.name}: #{player2.score}".colorize(:light_blue)
end

def game_over(player1, player2)
  if player1.lives == 0
    puts "The game is over for you, #{player1.name}! You are out of lives! #{player2.name} beat you by a score of #{player2.score} to #{player1.score}!".colorize(:yellow)
  elsif player2.lives == 0
    puts "The game is over for you, #{player2.name}! You are out of lives! #{player1.name} beat you by a score of #{player1.score} to #{player2.score}!".colorize(:yellow)
  else
  end
end

def game
  puts "Let's get started!".colorize(:yellow)

  @player1 = Player.new('Player 1')

  # puts "#{@player1.lives}"

  @player2 = Player.new('Player 2')

  loop do

    turn(@player1)

    score_report(@player1, @player2)

    turn(@player2)

    score_report(@player1, @player2)

    break if (@player1.lives == 0 || @player2.lives == 0)
  
  end

  game_over(@player1, @player2)

end

