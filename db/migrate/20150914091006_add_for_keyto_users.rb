class AddForKeytoUsers < ActiveRecord::Migration
  def change
    add_column :roles, :description, :string
    add_column :users, :employee_id, :integer
    add_foreign_key :users, :employees
  end
end
