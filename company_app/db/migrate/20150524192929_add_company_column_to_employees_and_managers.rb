class AddCompanyColumnToEmployeesAndManagers < ActiveRecord::Migration
  def change
    add_column(:employees, :company_id, :integer)
    
    add_column(:managers, :company_id, :integer)
  end
end
