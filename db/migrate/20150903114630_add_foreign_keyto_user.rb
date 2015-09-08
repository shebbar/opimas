class AddForeignKeytoUser < ActiveRecord::Migration
  def change
    add_foreign_key :users, :companies
  end
end
