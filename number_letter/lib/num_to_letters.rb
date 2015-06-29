numbers = {
1 => "one",	
2	=> "two",
3	=> "three",
4	=> "four",
5	=> "five",
6	=> "six",
7	=> "seven",	
8	=> "eight",	
9	=> "nine",	
10	=> "ten",	
11	=> "eleven",	
12	=> "twelve",
13	=> "thirteen",	
14	=> "fourteen",	
15	=> "fifteen",	
16	=> "sixteen",	
17	=> "seventeen",	
18	=> "eighteen",	
19	=> "nineteen",	
}
twenty_to_nighty_nine = {
2	=> "twenty",		
3	=> "thirty",	
4	=> "forty",	 	 
5	=> "fifty",	 	 
6	=> "sixty",	 	 
7	=> "seventy",	 	 
8	=> "eighty",	 	 
9	=> "ninety",
  }
#100	=> hundred	 	 
#1,000	=> thousand	 	 
#10,000	ten thousand	 	 
#100,000	a/one hundred thousand	 	 
#1,000,000	a/one million	 	 
#1,000,000,000	a/one billion

class Fixnum
  numbers_till_20 = {
    1 => "one",	
    2	=> "two",
    3	=> "three",
    4	=> "four",
    5	=> "five",
    6	=> "six",
    7	=> "seven",	
    8	=> "eight",	
    9	=> "nine",	
    10	=> "ten",	
    11	=> "eleven",	
    12	=> "twelve",
    13	=> "thirteen",	
    14	=> "fourteen",	
    15	=> "fifteen",	
    16	=> "sixteen",	
    17	=> "seventeen",	
    18	=> "eighteen",	
    19	=> "nineteen",	
    }
  twenty_to_nighty_nine = {
      2	=> "twenty",		
      3	=> "thirty",	
      4	=> "forty",	 	 
      5	=> "fifty",	 	 
      6	=> "sixty",	 	 
      7	=> "seventy",	 	 
      8	=> "eighty",	 	 
      9	=> "ninety",
    }
   
  define_method(:get_word_20) do
    
    result_to_return = ""
    
    numbers_till_20.each_pair() do |number, number_in_word|
      if number.==(self)
        result_to_return = number_in_word
      end
    end
  
    result_to_return
  end
  
  
  define_method(:get_word_99) do
    string_to_return = []
    num_in_string = self.to_s.split("")
    twenty_to_nighty_nine.each_pair() do |num, num_letter|
      if (num == num_in_string[0].to_i()) 
        string_to_return.push(num_letter)
      end
    end
    string_to_return.push(num_in_string[1].to_i().get_word_20())  
    string_to_return.join(" ")
  end
  
  define_method(:get_word_999) do
    string_to_return = []
    dozens = []
    num_in_string = self.to_s.split("")
    string_to_return.push(num_in_string[0].to_i().get_word_20() + " hundred " )
    dozens.push(num_in_string[1]).push(num_in_string[2])
    dozens = dozens.join().to_i()
    string_to_return.push(dozens.get_word_99()).join()
  end
  
  define_method(:get_word_999999) do
    string_to_return = []
    thousands = []
    hundreds = []
    num_in_string = self.to_s.split("")
    num_in_string.length.times() do |i|
      if (i.<(num_in_string.length - 3))
        thousands.push(num_in_string[i])
      else
        hundreds.push(num_in_string[i])
      end
    end
    thousands = thousands.join().to_i().get_word_999()
    hundreds = hundreds.join().to_i().get_word_999()
    string_to_return.push(thousands).push(" thousands ").push(hundreds).join()
  end
  
  define_method(:get_word_999999999) do
    string_to_return = []
    millions = []
    thousands_hundreds = []
    num_in_string = self.to_s.split("")
    num_in_string.length.times() do |i|
      if (i.<(num_in_string.length - 3))
        millions.push(num_in_string[i])
      else
        thousands_hundreds.push(num_in_string[i])
      end
    end
    
    millions = millions.join().to_i().get_word_999()
    thousands_hundreds = thousands_hundreds.join().to_i().get_word_999999()
    string_to_return.push(millions).push(" millions ").push(thousands_hundreds).join()
  end
  
  
end

puts 18.get_word_20()

puts 56.get_word_99()

puts 423.get_word_999()

puts 646.get_word_999()

puts 47546.get_word_999999()
puts 457474546.get_word_999999999()