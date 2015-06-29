require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')
set :bind, '0.0.0.0'

get("/") do
  @list_dealerships = Dealership.all()
  erb(:index)
end

post("/dealerships") do
  name_dealership = params.fetch("name")
  dealership = Dealership.new(name_dealership)
  dealership.save()
  @list_dealerships = Dealership.all() 
  erb(:index)
end

get('/dealerships/:id') do
  id = params.fetch("id")
  @dealership = Dealership.find(id.to_i())
  erb(:dealership)
end

post('/vehicles') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  new_car = Vehicle.new(make, model, year)
  new_car.save()
  @dealership = Dealership.find(params.fetch("dealership_id").to_i())
  @dealership.add_vehicle(new_car)
  erb(:dealership)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch("id").to_i)
  erb(:vehicle)
end



