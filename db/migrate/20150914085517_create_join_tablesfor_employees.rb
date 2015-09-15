class CreateJoinTablesforEmployees < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? :roles
      drop_table :roles
    end

    create_table :roles do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :employees_roles, id: false do |t|
      t.integer :employee_id
      t.integer :role_id
    end

    create_table :categories_employees, id: false do |t|
      t.integer :employee_id
      t.integer :category_id
    end

    add_index :employees_roles, :employee_id
    add_index :employees_roles, :role_id

    add_index :categories_employees, :employee_id
    add_index :categories_employees, :category_id
  end
end
