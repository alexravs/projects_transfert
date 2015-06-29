class AddColumnRegionsIdToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :regions_id, :integer
  end
end
