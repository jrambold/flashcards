#card test
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './card'

class Test_Card < Minitest::Test
  def test_card_exists
    card = Card.new("question","answer","hint")
    assert_instance_of Card, card
    assert_equal card.question, "question"
    assert_equal card.answer, "answer"
    assert_equal card.hint, "hint"
  end
end
