class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.column :name, :string
      
      
      t.timestamp
    end
  end
end
