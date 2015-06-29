class Parcel
  define_method(:initialize) do |length, width, weight|
    
    @length = length
    @width = width
    @weight = weight
    
  end
  
  define_method(:volume) do
    @length.*(@width) 
  end
  
  define_method(:cost_to_ship) do
    5.+((0.50).*(@weight))
  end

end

paquet = Parcel.new(15, 20, 40)

puts paquet.volume()

puts paquet.cost_to_ship()