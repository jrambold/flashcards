class Deck

  require_relative 'card'
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def add_card(new_card)
    @cards << new_card
  end

end
