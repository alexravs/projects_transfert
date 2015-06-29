day_of_week = Hash.new()
week_days_array = ["Monday", "Tuesday", "Wedensday", "Thursday", "Friday", "Saturday", "Sunday"]
(0..6).each() do |number|
  day_of_week.store(number, week_days_array[number])
end

class String
  define_method(:get_day_of_week) do
    week_days_array = [ "Sunday","Monday", "Tuesday", "Wedensday", "Thursday", "Friday", "Saturday"]
    date_array_format = []
    puts self.split("/")
    self.split("/").each() do |date_part|
      date_array_format.push(date_part.to_i)
    end
    puts date_array_format
    date_entered = Time.new(date_array_format[2],date_array_format[1],date_array_format[0])
    puts date_entered
    to_return = 7
    week_days_array.each_index() do |index|
      if date_entered.wday().==(index)
        to_return = week_days_array[index]
      end
    end
    to_return
  end
end

puts "15/04/2015".get_day_of_week()