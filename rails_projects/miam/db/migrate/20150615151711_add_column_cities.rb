class AddColumnCities < ActiveRecord::Migration
  def change
    add_column :cities, :region, :text
    add_column :cities, :lng, :float
    add_column :cities, :lat, :float
    add_column :cities, :countr_code, :text
        
  end
end
