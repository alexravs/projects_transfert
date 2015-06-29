class AddColumnEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :review, :text
  end
end
