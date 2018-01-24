require_relative 'round'
require_relative 'cardgenerator'
require_relative 'card'
require_relative 'deck'

filename = ARGV[0]
ARGV.clear #needed otherwise gets tries to read ARGV
if !filename
  puts "Enter a card file or press enter to use cards.txt"
  filename = gets.chomp
  if filename == ""
    filename = "cards.txt"
  end
end

#round returns deck of failed questions. this restarts the game until all correct
attempt = Round.new(CardGenerator.new(filename).cards)
again = attempt.start
while again.count > 0
  puts "Try again with the cards you missed!"
  attempt = Round.new(again)
  again = attempt.start
end
