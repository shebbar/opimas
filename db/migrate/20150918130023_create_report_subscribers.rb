class CreateReportSubscribers < ActiveRecord::Migration
  def change
    create_table :report_subscribers do |t|
      t.integer :company_id
      t.datetime :contract_start_date
      t.datetime :contract_end_date
      t.string :contract_currency
      t.decimal :contract_value, :precision => 8, :scale => 2

      t.timestamps null: false
    end
    add_index  :report_subscribers, :company_id 
  end
end
