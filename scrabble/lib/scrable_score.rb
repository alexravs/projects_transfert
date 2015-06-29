scrable_score = {
["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
["D", "G"]                                         => 2,
["B", "C", "M", "P"]                               => 3,
["F", "H", "V", "W", "Y"]                          => 4,
["K"]                                              => 5,
["J", "X"]                                         => 8,
["Q", "Z"]                                         => 10
}



class String
  
  define_method(:get_scrable_score) do
    score_to_return = 0
    scrable_score = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"]                                         => 2,
    ["B", "C", "M", "P"]                               => 3,
    ["F", "H", "V", "W", "Y"]                          => 4,
    ["K"]                                              => 5,
    ["J", "X"]                                         => 8,
    ["Q", "Z"]                                         => 10
    }
    
    word_splitted = self.split("")
    word_splitted.each() do |letter|
      scrable_score.each_pair() do |letter_array, score|
        if letter_array.include?(letter)
          score_to_return += score
        end
      end
    end
    score_to_return
  end
end
puts "ALEXANDRE".get_scrable_score()
