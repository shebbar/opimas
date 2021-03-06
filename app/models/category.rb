class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => :parent_id, :dependent => :destroy
  has_one :parent, :class_name => "Category", :primary_key => :parent_id, :foreign_key => :id
  has_and_belongs_to_many :employees, join_table: :categories_employees
  has_and_belongs_to_many :reports, join_table: :categories_reports
  has_many :category_subscribers, through: :category_subscriptions
  has_many :category_subscriptions
end
