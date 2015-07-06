class AddColumnProduct < ActiveRecord::Migration
  def change
    add_column :products, :sub_category_id, :int
  end
end
