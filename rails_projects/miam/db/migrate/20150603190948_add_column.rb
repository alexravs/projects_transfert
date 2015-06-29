class AddColumn < ActiveRecord::Migration
  def change
    add_column :establishments, :adress, :string
    add_column :establishments, :city_id, :integer
  end
end
