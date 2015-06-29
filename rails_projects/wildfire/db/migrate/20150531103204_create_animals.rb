class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      
      t.column :name, :string
      t.column :species, :integer
      t.column :latitude, :integer
      t.column :longetitude, :integer
      t.column :date, :date
      
      
      t.timestamp
    end
  end
end
