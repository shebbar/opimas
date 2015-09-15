class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.references :manager, index: true
      t.datetime :joining_date
      t.timestamps null: false
    end
  end
end
