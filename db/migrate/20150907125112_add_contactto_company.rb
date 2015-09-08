class AddContacttoCompany < ActiveRecord::Migration
  def change
    add_column :companies, :phone, :string
    add_column :companies, :email, :string
  end
end
