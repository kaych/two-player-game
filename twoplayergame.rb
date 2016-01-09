### OLD CODE

# @players = [
#   { name: "Player 1",
#     score: 0,
#     lives: 3 },
#   { name: "Player 2",
#     score: 0,
#     lives: 3 }
# ]

# @players = {}

# def game
#   puts "Let's get started!"

#   # player1 = Player.new('Player 1')
  
#   # @player_lives = 3
#   # @player_score = 0
#   # @players = ["Player 1","Player 2"]

#   def generate_question
#     @first_number = rand(1..20)
#     @second_number = rand(1..20)

#     @question = "What is #{@first_number} + #{@second_number}?"
#     @answer = @first_number + @second_number
#   end

#   #generate_question

#   def prompt_player_for_answer(player)
#     puts @question
#     @player_input = gets.chomp.to_i
#   end

#   #prompt_player_for_answer

#   # def verify_answer(player)
#   #   if @player_input == @answer
#   #     return true 
#   #   else
#   #     return false
#   # end

#   def verify_answer(player) 
#     # @player_lives = 3
#     # @player_score = 0
    
#     if @answer == @player_input
#       # return true
#       player[:score] += 1
#       puts "Correct!"
#     else
#       # return false
#       player[:lives] -= 1
#       puts "Oh no, that's wrong! Looks like you lost a life!"
#     end

#   end

#   #verify_answer

#   def turn(player)
#     puts "#{player.name}, it's your turn!"
#     generate_question
#     prompt_player_for_answer(player)
#     verify_answer(player)
#   end

#   def score_report(player1, player2)
#     puts "The score is #{player1[:name]}: #{player1[:score]} to #{player2[:name]}: #{player2[:score]}"
#   end

#   def game_over(player1, player2)
#     if player1[:lives] == 0
#       puts "The game is over for you, #{player1[:name]}! You are out of lives! #{player2[:name]} beat you by a score of #{player2[:score]} to #{player1[:score]}!"
#     elsif player2[:lives] == 0
#       puts "The game is over for you, #{player2[:name]}! You are out of lives! #{player1[:name]} beat you by a score of #{player1[:score]} to #{player2[:score]}!"
#     else
#     end
#   end

#   loop do

#     turn(@players[0])

#     score_report(@players[0], @players[1])

#     turn(@players[1])

#     score_report(@players[0], @players[1])

#     # puts "It's Player 1's turn!"

#     # generate_question

#     # prompt_player_for_answer(@players[0])

#     # verify_answer(@players[0])

#     # puts "The score is Player 1: #{@players[0][:score]} to Player 2: #{@players[1][:score]}"

#     # puts "It's Player 2's turn!"

#     # generate_question

#     # prompt_player_for_answer(@players[1])

#     # verify_answer(@players[1])

#     # puts "The score is Player 1: #{@players[0][:score]} to Player 2: #{@players[1][:score]}"

#     # if (@players[0][:lives] == 0 || @players[1][:lives] == 0)
#     #   puts "The game is over!"
#     # end

#     break if (@players[0][:lives] == 0 || @players[1][:lives] == 0)
  
#   end

#   game_over(@players[0], @players[1])

# end

### NEW CODE

def generate_question
  @first_number = rand(1..20)
  @second_number = rand(1..20)

  @question = "> What is #{@first_number} + #{@second_number}?"
  @answer = @first_number + @second_number
end


def prompt_player_for_answer(player)
  puts @question.colorize(:light_blue)
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




