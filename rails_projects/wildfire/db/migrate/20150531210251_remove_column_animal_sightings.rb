class RemoveColumnAnimalSightings < ActiveRecord::Migration
  def change
    remove_column :sightings, :name
  end
end
