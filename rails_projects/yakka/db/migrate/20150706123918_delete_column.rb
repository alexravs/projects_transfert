class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column(:sub_categories, :category_id)
  end
end
