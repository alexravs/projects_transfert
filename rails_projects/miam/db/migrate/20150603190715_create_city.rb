class CreateCity < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.column :name, :string
      t.column :zipcode, :integer
      t.column :country, :string
      
      t.timestamp
    end
  end
end
