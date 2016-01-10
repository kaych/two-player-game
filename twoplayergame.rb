def generate_numbers
  @first_number = rand(1..20)
  @second_number = rand(1..20)
end

### brute-force code

# def randomize_question(first_number, second_number)
#   operator = rand(1..3)
#     if operator == 1
#       @question = "> What is #{first_number} + #{second_number}?"
#       @answer = first_number + second_number
#     elsif operator == 2
#       @question = "> What is #{first_number} - #{second_number}?"
#       @answer = first_number - second_number
#     else
#       @question = "> What is #{first_number} * #{second_number}?"
#       @answer = first_number * second_number
#     end
#   @question
# end

## improved code

def generate_operator
  operator = [:+, :-, :*]
  @random_operator = operator.sample
end

def randomize_question(first_number, second_number, operator)
  @answer = first_number.send(operator, second_number)
  return @question = "What is #{first_number} #{operator} #{second_number}?"
end

def prompt_player_for_answer(player)
  puts randomize_question(@first_number, @second_number, @random_operator)
  @player_input = gets.chomp.to_i
end

def verify_answer(player) 
  if @answer == @player_input
    player.gain_point
    puts "Correct! You gain a point!".colorize(:green)
  else
    player.lose_life
    puts "Oh no, that's wrong. You lose a life.".colorize(:red)
  end
end

def turn(player)
  puts "#{player.name}, it's your turn!".colorize(:light_blue)
  generate_numbers
  generate_operator
  prompt_player_for_answer(player)
  verify_answer(player)
end

def report_score(player1, player2)
  puts "The score is #{player1.name}: #{player1.score} to #{player2.name}: #{player2.score}".colorize(:light_blue)
end

def report_lives(player1, player2)
  puts "#{player1.name} has #{player1.lives} lives left. #{player2.name} has #{player2.lives} lives left.".colorize(:light_blue)
end

def update_status
  report_score(@player1, @player2)
  report_lives(@player1, @player2)
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

  @player1 = Player.new("Player 1")

  # puts "#{@player1.lives}"

  @player2 = Player.new("Player 2")

  loop do

    turn(@player1)

    update_status

    turn(@player2)

    update_status

    break if (@player1.lives == 0 || @player2.lives == 0)
  
  end

  game_over(@player1, @player2)

end
