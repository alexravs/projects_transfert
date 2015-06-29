class DeleteSpeciesColumnAnimals < ActiveRecord::Migration
  def change
    remove_column :animals, :species
  end
end
