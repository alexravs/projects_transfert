class Fixnum 
  define_method(:leap_year?) do
    self.%(4).==(0) #refactored
  end
end