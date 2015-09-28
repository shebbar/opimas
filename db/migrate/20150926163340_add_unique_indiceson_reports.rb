class AddUniqueIndicesonReports < ActiveRecord::Migration
  def change
    add_index :categories_reports, [:category_id, :report_id], unique: true, :name => 'index_cat_reps'
    add_index :employees_reports, [:employee_id, :report_id], unique: true, :name => 'index_emp_reps'
 end
end
