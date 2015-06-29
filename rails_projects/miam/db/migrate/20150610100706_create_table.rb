class CreateTable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.column :establishment_id, :integer
      t.column :user_id, :integer
      
      t.timestamp
    end
  end
end
