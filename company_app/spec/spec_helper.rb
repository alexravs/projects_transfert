ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("manager")

RSpec.configure do |config|
  config.after(:each) do
    Company.all().each() do |company|
      company.destroy()
    end
  end
end