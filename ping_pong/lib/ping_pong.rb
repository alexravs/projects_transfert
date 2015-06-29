class Fixnum
  define_method(:get_range_pingpong) do 
    range_to_array = (1..self)
    result_array = []
    range_to_array.each() do |number|
      result_array.push(number)
    end
    result_array
  end
  
  
  define_method(:convert_num_to_pingpong) do
    what_to_return = 0
    if self.%(3).==(0).&(self.%(5).==(0).!())
      what_to_return = "Ping"
    elsif self.%(5).==(0).&(self.%(3).==(0).!())
      what_to_return = "Pong"
    elsif self.%(5).==(0).&(self.%(3).==(0))
      what_to_return = "PingPong"
		else
      what_to_return = self
		end
    what_to_return
  end
  
  define_method(:get_pingpong) do
    range = self.get_range_pingpong()
    ping_pong_array = []
    range.each() do |number|
      ping_pong_array.push(number.convert_num_to_pingpong())
    end
    ping_pong_array
  end
end


=begin 
class Array
  define_method(:to_ping) do 
    array_to_return
    self.each() do |number|
      if number.%(3).==(0).&(number.%(5).==(0).!())
        array_to_return.push("Ping")
      else
    end
  end
end
=end