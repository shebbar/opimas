class MakeEmployeesBelongtoUsers < ActiveRecord::Migration
  def change
    remove_foreign_key :users, :employees
    remove_column :users, :employee_id
    add_foreign_key :employees, :users
  end
end
