class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :photo_path, :string
      t.column :owner_id, :integer
      
    end
  end
end
