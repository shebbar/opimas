class CategorySubscriber < ActiveRecord::Base
  belongs_to :company 
  has_many :categories, through: category_subscriptions
end
