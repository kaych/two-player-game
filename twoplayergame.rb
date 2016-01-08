def game
  puts "Let's get started!" #first prompt
  @player_lives = 3
  @player_score = 0
#   @players = ["Player 1"]# ,"Player 2"]

#   # player1 = "Player 1"
#   # player2 = "Player 2"
#   input(@players)
#   # @player2_input
#   lives_counter(@players) == 3
#   score(@players) == 0

  def generate_question
    @first_number = rand(1..20)
    @second_number = rand(1..20)

    @question = "What is #{@first_number} + #{@second_number}?"
    @answer = @first_number + @second_number
  end

  #generate_question

  def prompt_player_for_answer#(player)
    puts @question
    @player_input = gets.chomp.to_i
  end

  #prompt_player_for_answer

  def verify_answer#(player_input) #both right answer and lives
    # @player_lives = 3
    # @player_score = 0
    if @answer == @player_input
      @player_score += 1
      puts "Congrats, das correct!"
    else
      @player_lives -= 1
      puts "Oh no, looks like you lost a life!"
    end
  end

  #verify_answer

  #puts "The score is Player 1: #{@player_score}" #to Player 2: #{player2_score}"

#   def score_counter(player)
#     # code: player(x) has value of @player_score
#     @player_score = 0

#     @players.each do |score|
#       score += 
#     end
#   end




  loop do
    generate_question

    prompt_player_for_answer#(input(@players))

    verify_answer#(input(@players))

    puts "The score is Player 1: #{@player_score} with #{@player_lives}" #to Player 2: #{player2_score}"

    # generate_question

    # prompt_player_for_answer(@players[1])

    # verify_answer(@player2_input)

    # print "The score is Player 1: #{@player1_score} to Player 2: #{player2_score}"

    if @player_lives == 0 #|| player2_lives == 0)
      puts "The game is over!"
    end

    break if (@player_lives == 0) #|| player2_lives == 0)
  
  end

end

game






