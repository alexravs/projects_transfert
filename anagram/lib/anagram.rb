class String
  define_method(:compare_sorted_words) do |word_to_compare|
    self_splitted=self.split("").sort()
    word_to_compare_splitted=word_to_compare.split("").sort()
    if self_splitted.length().==(word_to_compare_splitted.length())
      result = true
      self_splitted.each_index() do |index| 
        if self_splitted[index].eql?(word_to_compare_splitted[index]).!()
          result = false
        end
      end
    else
      result = false
    end
    result
  end
  define_method(:get_anagram) do |list_of_words|
    main_word = self

    list_to_analyze = list_of_words
   
    list_to_return = []
    list_to_analyze.each() do |possible_anagram|

      if main_word.compare_sorted_words(possible_anagram)
        list_to_return.push(possible_anagram)
      end
    end
 
    list_to_return
  end
end
