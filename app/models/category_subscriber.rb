class CategorySubscriber < ActiveRecord::Base
  belongs_to :company 
  has_many :categories, through: :category_subscriptions
  has_many :category_subscriptions
  has_and_belongs_to_many :employees, join_table: :category_subscribers_sales
end
