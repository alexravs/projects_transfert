class AddColumnTweetsMessage < ActiveRecord::Migration
  def change
    add_column(:tweets, :created_at, :datetime)
    add_column(:tweets, :updated_at, :datetime)
    add_column :tweets, :message, :text
  end
end
