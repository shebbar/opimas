class DropUseridfromCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :user_id
    remove_column :companies, :subscription_id
  end
end
