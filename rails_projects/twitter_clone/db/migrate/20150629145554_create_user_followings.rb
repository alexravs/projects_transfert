class CreateUserFollowings < ActiveRecord::Migration
  def change
    create_table :user_followings do |f|
      f.column :user_a_id, :integer
      f.column :user_b_id, :integer
      f.column :created_at, :date
      
      f.timestamp
    end
  end
end
