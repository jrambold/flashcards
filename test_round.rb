#card test
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './card'
require './round'
require './deck'

class Test_Round < Minitest::Test
  def test_round_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau","1")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000","2")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
    assert_equal round.deck, deck
    assert_equal round.current_card, nil
  end
end
