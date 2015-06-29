class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table(:projects) do |t| 
      t.column(:name, :string)
      t.column(:due_date, :date)
      t.column(:done, :boolean)
      
      t.timestamps
    end
  end
end
