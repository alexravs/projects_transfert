require('sinatra')
require('sinatra/reloader')
require_relative('lib/clock_angle') #if doesn't work, re check without the .rb
set :bind, '0.0.0.0'
get('/') do
  erb(:home)
end


get('/result') do
  date_string=params.fetch('time')
  @date_to_show = date_string.time_string_to_distance()
  erb(:result)
end