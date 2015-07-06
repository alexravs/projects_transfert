#     t.string  "prod_nom",               limit: 20,  null: false
#     t.string  "prod_vignette",          limit: 100, null: false
#     t.string  "prod_image",             limit: 100, null: false
#     t.string  "prod_descr_courte",      limit: 100, null: false
#     t.string  "prod_descr_longue",      limit: 500, null: false
#     t.integer "prod_stat",                          null: false
#     t.integer "prod_fk_sub_categories"

class Product < ActiveRecord::Base
  belongs_to :sub_category
end