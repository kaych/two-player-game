def game
  puts "Let's get started!" 
  
  # @player_lives = 3
  # @player_score = 0
  # @players = ["Player 1","Player 2"]

  @players = [
    { name: "Player 1",
      score: 0,
      lives: 3
    },
    { name: "Player 2",
      score: 0,
      lives: 3 }
  ]

  def generate_question
    @first_number = rand(1..20)
    @second_number = rand(1..20)

    @question = "What is #{@first_number} + #{@second_number}?"
    @answer = @first_number + @second_number
  end

  #generate_question

  def prompt_player_for_answer(player)
    puts @question
    @player_input = gets.chomp.to_i
  end

  #prompt_player_for_answer

  def verify_answer(player) 
    # @player_lives = 3
    # @player_score = 0
    
    if @answer == @player_input
      player[:score] += 1
      puts "Correct!"
    else
      player[:lives] -= 1
      puts "Oh no, that's wrong! Looks like you lost a life!"
    end

  end

  #verify_answer

  def turn(player)
    puts "#{player[:name]}, it's your turn!"
    generate_question
    prompt_player_for_answer(player)
    verify_answer(player)
  end

  def score_report(player1, player2)
    puts "The score is #{player1[:name]}: #{player1[:score]} to #{player2[:name]}: #{player2[:score]}"
  end

  loop do

    turn(@players[0])

    score_report(@players[0], @players[1])

    turn(@players[1])

    score_report(@players[0], @players[1])

    # puts "It's Player 1's turn!"

    # generate_question

    # prompt_player_for_answer(@players[0])

    # verify_answer(@players[0])

    # puts "The score is Player 1: #{@players[0][:score]} to Player 2: #{@players[1][:score]}"

    # puts "It's Player 2's turn!"

    # generate_question

    # prompt_player_for_answer(@players[1])

    # verify_answer(@players[1])

    # puts "The score is Player 1: #{@players[0][:score]} to Player 2: #{@players[1][:score]}"

    if (@players[0][:lives] == 0 || @players[1][:lives] == 0)
      puts "The game is over!"
    end

    break if (@players[0][:lives] == 0 || @players[1][:lives] == 0)
  
  end

end

game




