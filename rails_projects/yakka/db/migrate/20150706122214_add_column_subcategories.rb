class AddColumnSubcategories < ActiveRecord::Migration
  def change
    add_column :sub_categories, :category_id, :int
    
  end
end
