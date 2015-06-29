require('rspec')
require('anagram')

describe("String#compare_sorted_words") do 
  
  it("compare two sorted words, gives true if identical") do
    expect("hello".compare_sorted_words("lolhe")).to(eq(true))
  end
  it("compare two sorted words, gives false if not identical") do
    expect("goiedag".compare_sorted_words("goerzah")).to(eq(false))
  end
  
end

describe("String#get_anagram") do
  it("compares a word with a list of words to get anagrams") do
    expect(("goeidag").get_anagram(["daggoie", "heello", "iegogad", "test1212","dagygie"])).to(eq(["daggoie", "iegogad"]))
  end
end