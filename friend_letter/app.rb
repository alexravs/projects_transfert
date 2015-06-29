require ('sinatra')
require('sinatra/reloader')
require('rerun')
set :bind, '0.0.0.0'

get('/') do
  @friend = "Nico"
  erb :letter
end

get('/australia') do
  @recipient = "Justine"
  @sender = "Alex"
  erb(:australia)
end

get('/favorite_photos') do
  erb(:favorite_photos)
end

get('/greeting_form') do
  erb(:form)
end

get('/greeting_card') do 
  @sender = params.fetch('sender')
  @recipient = params.fetch('recipient')
  erb(:greeting_card)
end