require_relative('word')

class Game
  
  @@games = []
  
  define_method(:initialize) do |word|
    @word_to_be_seeked = Word.new().word()
    @word_to_be_seeked_array = @word_to_be_seeked.split("")
    @bet = 7
    @revealed_word = []
    @word_to_be_seeked.length().times() do 
      @revealed_word.push(" _ ")
    end
    @id = @@games.length() + 1
  end
  
  define_method(:save) do
    @@games.push(self)
  end
  
  define_method(:word) do
    @word_to_be_seeked
  end
  
  define_method(:id) do 
    @id
  end
  
  define_method(:all) do
    @@games
  end
  
  define_method(:bet) do
    @bet
  end
  
  define_method(:deduct_bet) do
    @bet = @bet - 1
  end
  
  define_method(:revealed) do
    @revealed_word
  end
  
  define_method(:analyze) do |letter|
    letter_found = 0
    @word_to_be_seeked_array.each_with_index() do |passing_letter, index|
      if passing_letter.eql?(letter)
        @revealed_word[index] = letter
        letter_found = letter_found + 1
      end
    end
    letter_found
  end
  
  define_method(:evolve_bet) do |number_letter_found|
    if number_letter_found.eql?(0)
      @bet = @bet - 1
    end
  end
  
  define_singleton_method(:find) do |identification|
    found_game = nil
    @@games.each() do |game|
      if game.id().eql?(identification.to_i())
        found_game = game
      end
    end
    found_game 
  end
  
end

#testW = Word.new

#test = Game.new(testW)

#puts test.word()

#puts test.analyze("e")

#test.evolve_bet(test.analyze("e"))

#puts test.bet()

#puts test.revealed()