#card test
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './card'
require './cardgenerator'
require './deck'

class Test_CardGenerator < Minitest::Test
  def test_cardg_exists
    cardg = CardGenerator.new("cards.txt")
    assert_instance_of CardGenerator, cardg
  end

  def test_imported_correct_num_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal cards.count, 4
  end

end
