class ReportSubscriber < ActiveRecord::Base
  belongs_to :company
  has_many :reports, through: :report_subscriptions
  has_many :report_subscriptions
  has_and_belongs_to_many :employees, join_table: :report_subscribers_sales
end
