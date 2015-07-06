class IdentifiantCombi < ActiveRecord::Base
  has_many :combinaisons
  has_many :prices
end