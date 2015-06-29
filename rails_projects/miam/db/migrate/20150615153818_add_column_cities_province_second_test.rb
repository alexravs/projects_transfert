class AddColumnCitiesProvinceSecondTest < ActiveRecord::Migration
  def change
    add_column :cities, :province, :text
  end
end
