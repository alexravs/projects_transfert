class ChangeTableNameIdentifiantCombi < ActiveRecord::Migration
  def change
    rename_table :identifiant_combi, :identifiant_combis
  end
end
