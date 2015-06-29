class Dealership 
  @@dealerships = []
  
  define_method(:initialize) do |name|
    @name = name
    @cars = []
    @id = @@dealerships.length().+(1) 
  end
  
  define_method(:name) do
    @name
  end
  
  define_method(:id) do 
    @id
  end
  
  define_singleton_method(:all) do
    @@dealerships
  end
  
  define_method(:cars) do
    @cars
  end

  define_method(:save) do 
    @@dealerships.push(self)
  end

  define_method(:clear) do
    @@dealership = []
  end
  
  define_method(:add_vehicle) do |vehicle|
    @cars.push(vehicle)
  end

  define_singleton_method(:find) do |identification|
    found_dealership = nil
    
    @@dealerships.each() do |dealership|
      if dealership.id().eql?(identification)
        found_dealership  = dealership
      end
    end
    
    found_dealership 
  end

end

