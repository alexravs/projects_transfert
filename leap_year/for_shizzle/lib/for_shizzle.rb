class String
  define_method(:foshizzle) do
    original_string_splitted = self.split("")
    new_string_shizzled = Array.new()
    original_string_splitted.each_with_index() do |letter, index|
      if letter.eql?("s").&(index.==(0).!())
        if original_string_splitted[index-1].!=(" ")
          new_string_shizzled.push("z")
        else
          new_string_shizzled.push(letter)
        end
      else
        new_string_shizzled.push(letter)
      end
    end
    new_string_shizzled = new_string_shizzled.join()
  end
end



