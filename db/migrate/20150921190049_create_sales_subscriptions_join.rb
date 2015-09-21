class CreateSalesSubscriptionsJoin < ActiveRecord::Migration
  def change
    create_table :report_subscribers_sales, id: false do |t|
      t.integer :employee_id
      t.integer :report_subscriber_id
    end

    create_table :category_subscribers_sales, id: false do |t|
      t.integer :employee_id
      t.integer :category_subscriber_id
    end

    add_index :report_subscribers_sales, :employee_id
    add_index :report_subscribers_sales, :report_subscriber_id

    add_index :category_subscribers_sales, :employee_id
    add_index :category_subscribers_sales, :category_subscriber_id

    add_index :report_subscribers_sales, [:employee_id, :report_subscriber_id], unique: true, :name => 'index_sales_rep_subs'
    add_index :category_subscribers_sales, [:employee_id, :category_subscriber_id], unique: true, :name => 'index_sales_cat_subs'
  end
end
