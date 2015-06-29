class RemoveColumnEstablishments < ActiveRecord::Migration
  def change
    remove_column :establishments, :review
  end
end
