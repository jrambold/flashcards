

class Guess

  require_relative 'card'
  attr_accessor :response,
                :card

  def initialize (response,card)
    @response = response
    @card = card
    @correct = @card.answer == @response
  end

  def get_answer
    return @card.answer
  end

  def get_question
    return @card.question
  end

  def correct?
    @correct
  end

  def feedback
    if @correct
      return "Correct"
    else
      return "Incorrect"
    end
  end

end
