class CardGenerator #reads file with , seperator to make card files in a deck
  require_relative 'card'
  attr_reader :cards

  def initialize(filename)
    card_adder = []
    card_file = IO.readlines(filename)
    card_file.each do |cardfile|
      card = cardfile.split(",",3)
      if card[0] != ""
        card_adder << Card.new(card[0],card[1],card[2])
      end
    end
    @cards = Deck.new(card_adder)
  end
end
