class AddColumnDescriptionToLists < ActiveRecord::Migration
  def change
    add_column :lists, :description, :string
  end
end
