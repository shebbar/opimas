class Employee < ActiveRecord::Base
  has_many :subordinates, :class_name => "Employee", :foreign_key => :manager_id
  has_one :manager, :class_name => "Employee", :primary_key => :manager_id, :foreign_key => :id
  has_and_belongs_to_many :categories, join_table: :categories_employees
  has_and_belongs_to_many :roles, join_table: :employees_roles
  belongs_to :user
  has_and_belongs_to_many :reports, join_table: :employees_reports
  has_and_belongs_to_many :report_subscriptions, join_table: :report_subscriptions_sales
  has_and_belongs_to_many :category_subscriptions, join_table: :category_subscriptions_sales
end
