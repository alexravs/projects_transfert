class Float
  define_method(:hours_to_mins) do |hours, minutes|
    if hours.>(11) 
      hours = hours - 12
    end
    hours_to_mins = hours.*(60)
    total = hours_to_mins + minutes
  end
  
  
  define_method(:mins_to_distance) do 
    self./(2)
  end
  
end

class String
  define_method(:converts_time_to_float) do
    time_array_string = self.split(":")
    time_array_float = []
    time_array_string.each() do |number|
      time_array_float.push(number.to_f())
    end
    time_array_float
  end
  
  define_method(:time_string_to_distance) do
    hours, mins = self.converts_time_to_float()
    total_mins = 0.00.hours_to_mins(hours, mins)
    total_mins.mins_to_distance()
  end
end