class AddColumunSpeciesIdAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :species_id, :integer
    
  end
end
