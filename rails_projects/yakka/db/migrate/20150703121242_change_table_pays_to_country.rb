class ChangeTablePaysToCountry < ActiveRecord::Migration
  def change
    rename_table :pays, :countries

    
  end
end
