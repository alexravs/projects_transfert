class InitializeColumns < ActiveRecord::Migration
  def change
    create_table(:managers) do |t|
      t.column(:firstname, :string)
      t.column(:lastname, :string)
      t.column(:email, :string)
      t.column(:username, :string)
      t.column(:password, :string)

      t.timestamps
    end
    
    create_table(:companies) do |t|
      t.column(:company_name, :string)
      

      t.timestamps
    end
  end
end
