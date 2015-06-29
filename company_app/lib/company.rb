class Company < ActiveRecord::Base
  has_many(:managers)
  has_many(:employees)
end


