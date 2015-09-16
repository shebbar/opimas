class CreateReportJoinTables < ActiveRecord::Migration
  def change
    create_table :employees_reports, id: false do |t|
      t.integer :employee_id
      t.integer :report_id
    end

    create_table :categories_reports, id: false do |t|
      t.integer :report_id
      t.integer :category_id
    end

    add_index :employees_reports, :employee_id
    add_index :employees_reports, :report_id

    add_index :categories_reports, :report_id
    add_index :categories_reports, :category_id
  end
end
