class CreateReportSubscriptions < ActiveRecord::Migration
  def change
    create_table :report_subscriptions do |t|
      t.integer :report_id
      t.integer :report_subscriber_id

      t.timestamps null: false
    end
    add_index :report_subscriptions, :report_id
    add_index :report_subscriptions, :report_subscriber_id
    add_index :report_subscriptions, [:report_id, :report_subscriber_id], unique: true, :name => 'index_rep_subs'
  end
end
