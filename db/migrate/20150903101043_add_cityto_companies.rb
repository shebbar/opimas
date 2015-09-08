class AddCitytoCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :city, :string
    add_column :companies, :zip, :string
  end
end
