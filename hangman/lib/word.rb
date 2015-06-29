class Word
  define_method(:initialize) do
    word_list = ["gelsemia",
                "semibureaucratic",
                "radicalness",
                "immeasurability",
                "nonplusing",
                "corgi",
                "nonerrant",
                "epidural",
                "doubly",
                "avail"]
    r = Random.new
    @word = word_list[r.rand(0...9)]
  end
  
  define_method(:word) do
    @word
  end
  
end

