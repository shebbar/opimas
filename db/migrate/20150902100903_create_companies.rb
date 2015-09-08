class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :contact_name
      t.string :address_1
      t.string :address_2
      t.string :region
      t.string :country
      t.integer :user_id
      t.integer :subscription_id

      t.timestamps null: false
    end
  end
end
