class CreateCategorySubscriptions < ActiveRecord::Migration
  def change
    create_table :category_subscriptions do |t|
      t.integer :category_id
      t.integer :category_subscriber_id

      t.timestamps null: false
    end
    add_index :category_subscriptions, :category_id
    add_index :category_subscriptions, :category_subscriber_id
    add_index :category_subscriptions, [:category_id, :category_subscriber_id], unique: true, :name => 'index_cat_subs'
  end
end
