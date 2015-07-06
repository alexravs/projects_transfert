#     t.date    "com_date",                       null: false
#     t.boolean "com_facture",    default: false, null: false
#     t.integer "com_fk_clients",                 null: false


class Order < ActiveRecord::Base
  belongs_to :client
  has_many :order_rows
end