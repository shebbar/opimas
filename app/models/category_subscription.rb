class CategorySubscription < ActiveRecord::Base
  belongs_to :category_subscriber
  belongs_to :category
end
