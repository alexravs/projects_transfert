#     t.string "prop_nom", limit: 20, null: false

class Property < ActiveRecord::Base
  has_many :characteristics
end

