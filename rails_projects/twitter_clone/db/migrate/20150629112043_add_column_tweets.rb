class AddColumnTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.column :user_id, :integer
    end
  end
    
end
