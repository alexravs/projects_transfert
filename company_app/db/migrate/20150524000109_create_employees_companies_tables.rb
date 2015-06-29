class CreateEmployeesCompaniesTables < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:firstname, :string)
      t.column(:lastname, :string)
      t.column(:email, :string)
      t.column(:username, :string)
      t.column(:password, :string)      
      t.timestamps
    end
    
    
    
  end
    
end
