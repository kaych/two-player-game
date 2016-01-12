require_relative 'player'
require_relative 'twoplayergame'
require_relative 'errors'
require 'colorize'

begin
  game
rescue Player::InvalidNameError => e 
  puts "That is not allowed! "
  puts e.message
end
# rescue InvalidGuessError => e
#   puts "Uh oh! Try again!"
#   puts e.message
# end

## test code
# player = Player.new
# puts player1.score