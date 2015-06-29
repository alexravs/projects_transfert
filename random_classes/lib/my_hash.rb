class MyHash
  define_method(:initialize) do 
    @key = []
    @value = []
  end
  
  define_method(:store) do |key, value| 
    @key.push(key)
    @value.push(value)
  end
  
  define_method(:fetch) do |key|
    matching_value = ""
    index = @key.index(key)
    if index.nil?()
      matching_value = "no existing value matching the key ".concat(key)
    else
      matching_value = @value[index]
    end
    matching_value
  end
  
  define_method(:has_value) do |value|
    @value.include?(value)
  end
  
  define_method(:has_key) do |key|
    @value.include?(key)
  end
  
  define_method(:length) do 
    @value.length()
  end
    
end