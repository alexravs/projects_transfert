class AddColumnCitiesProvince < ActiveRecord::Migration
  def changea
    dd_column :cities, :province, :text
  end
end
