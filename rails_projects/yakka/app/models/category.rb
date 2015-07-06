#     PROPERTIES

#     t.string  "cat_nom",  limit: 25, null: false
#     t.integer "cat_stat",            null: false

class Category < ActiveRecord::Base
  has_many :sub_categories 
end