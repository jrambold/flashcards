#guess test
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './guess'
require './card'

class Test_Guess < Minitest::Test
  def test_guess_exists
    card = Card.new("hello","world","easy")
    a = Guess.new("dlrow",card)
    assert_instance_of Guess, a
    assert_equal a.response, "dlrow"
    assert_equal a.card, card
  end

  def test_get_answer
    card = Card.new("hello","world","easy")
    a = Guess.new("world",card)
    assert_equal a.get_answer, "world"
  end

  def test_get_question
    card = Card.new("hello","world","easy")
    a = Guess.new("dlrow",card)
    assert_equal a.get_question, "hello"
  end

  def test_correct_feedback_true
    card = Card.new("hello","world","easy")
    a = Guess.new("world",card)
    assert a.correct?
    assert_equal a.feedback, "Correct"
  end

  def test_correct_feedback_false
    card = Card.new("hello","world","easy")
    a = Guess.new("dlrow",card)
    assert !a.correct?
    assert_equal a.feedback, "Incorrect"
  end

end
