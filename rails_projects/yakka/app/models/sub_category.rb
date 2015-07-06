#     t.string  "sscat_nom",           limit: 30, null: false
#     t.integer "sscat_fk_categories",            null: false
#     t.integer "sscat_stat",

class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products
end