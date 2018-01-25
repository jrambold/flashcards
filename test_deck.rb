#card test
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './deck'

class Test_Deck < Minitest::Test
    def test_deck_exists
      card_1 = Card.new("What is the capital of Alaska?", "Juneau","1")
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars","2")
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west","3")
      deck = Deck.new([card_1, card_2, card_3])
      assert_instance_of Deck, deck
      assert_equal deck.cards, [card_1, card_2, card_3]
    end

    def test_count
      card_1 = Card.new("What is the capital of Alaska?", "Juneau","1")
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars","2")
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west","3")
      deck = Deck.new([card_1, card_2, card_3])
      assert_equal deck.count, 3
    end

    def test_add_card
      card_1 = Card.new("What is the capital of Alaska?", "Juneau","1")
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars","2")
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west","3")
      deck = Deck.new([card_1, card_2])
      deck.add_card(card_3)
      assert_equal deck.cards, [card_1, card_2, card_3]
    end
end
