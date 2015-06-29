class CreateTableUserFellowships < ActiveRecord::Migration
  def change
    create_table :user_fellowships, :force => true, :id => false do |t|
      t.column :user_a_id, :integer
      t.column :user_b_id, :integer
    end
  end
end
