class ReportSubscriber < ActiveRecord::Base
  belongs_to :company
  has_many :reports, through: report_subscriptions
end
