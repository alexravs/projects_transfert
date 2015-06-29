class ChangeTableNameAnimals < ActiveRecord::Migration
  def change
    rename_table :animals, :sightings
  end
end
