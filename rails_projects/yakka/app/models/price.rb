#     PROPERTIES

#     t.decimal "pri_htva_euro",           precision: 6, scale: 3, null: false
#     t.decimal "pri_poids",               precision: 4, scale: 2
#     t.decimal "pri_vol_conditionnement", precision: 3, scale: 2

class Price < ActiveRecord::Base
  has_many :identifiant_combis
end
  