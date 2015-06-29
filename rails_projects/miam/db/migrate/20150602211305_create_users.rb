class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :firstname, :string
      t.column :lastname, :string
      t.column :username, :string
      
      t.timestamp
    end
  end
end
