class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.column :text, :text
      t.column :user_id, :integer
      t.column :establishment_id, :integer
      
      t.timestamp
    end
  end
end
