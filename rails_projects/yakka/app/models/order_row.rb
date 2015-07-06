#     t.integer "row_fk_orders",                      null: false
#     t.integer "row_fk_identifiant_combi",           null: false
#     t.integer "row_quantity",             limit: 2, null: false

class OrderRow < ActiveRecord::Base
  belongs_to :order
  belongs_to :identifiant_combi
  
end