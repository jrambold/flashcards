class Round

  require_relative 'deck'
  require_relative 'card'
  require_relative 'guess'
  require 'date'

  attr_reader :deck
              :guesses
              :current_card
              :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @total_cards = @deck.count
    @current_card = nil
    @number_correct = 0
    @number_attempts = 0
  end

  def record_guess(your_guess) #records guesses for use later
    @guesses << Guess.new(your_guess,@current_card)
    if @guesses.last.correct?
      @number_correct += 1
    end
    @number_attempts +=1
  end

  def percent_correct
    return (100*@number_correct/@number_attempts).to_s
  end

  def results #outputs results and each question/answer/response to a text file
    current_time = DateTime.now
    current_time = current_time.strftime("%Y-%m-%d-%I:%M:%S%P")
    results_file = File.new("results-#{current_time}.txt","w")
    results_file.puts("You had #{@number_correct} correct guesses out of #{@number_attempts} for a score of #{percent_correct}%.")
    guesses_result = @guesses
    guesses_result.each do |guesses_result|
      results_file.puts "\nQuestion #{guesses_result.get_question}"
      results_file.puts "Correct Answer: #{guesses_result.get_answer}"
      results_file.puts "Your answer: #{guesses_result.response}"
      results_file.puts guesses_result.feedback
    end
    results_file.close
  end

  def start
    puts "Welcome you are playing with #{@total_cards} cards."
    puts "-------------------------------------------------"
    again = Deck.new([])
    while @deck.count > 0 #loops through asking use each card in the deck
      @current_card = @deck.cards.pop
      puts "This is card #{@number_attempts+1} out of #{@total_cards}"
      puts "Question: #{@current_card.question}"
      this_guess = gets.chomp
      if this_guess == "hint"
        puts @current_card.hint
        this_guess = gets.chomp
      end
      record_guess(this_guess)
      puts @guesses.last.feedback
      if !@guesses.last.correct? #stores incorrect answers
        again.add_card(@current_card)
      end
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{@number_attempts} for a score of #{percent_correct}%."
    results #writes results to text file
    return again #returns deck of incorrect cards to ask again
  end

end
