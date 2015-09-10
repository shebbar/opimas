class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :users_roles, id: false do |t|
      t.integer :user_id
      t.integer :role_id
    end

    add_index :users_roles, :user_id
    add_index :users_roles, :role_id
  end
end
