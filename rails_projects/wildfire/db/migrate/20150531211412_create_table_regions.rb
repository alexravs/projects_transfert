class CreateTableRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.column :name, :string
      t.column :country, :string
      t.column :zipcode, :integer
        
      t.timestamp
    end
  end
end
