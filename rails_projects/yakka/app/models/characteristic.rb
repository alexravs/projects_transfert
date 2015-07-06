#     t.integer "car_fk_products",              null: false
#     t.integer "car_fk_properties", limit: 2,  null: false
#     t.string  "car_valeur",        limit: 20


class Characteristic < ActiveRecord::Base
  belongs_to :product
  belongs_to :property
  has_many :combinaisons
  

end