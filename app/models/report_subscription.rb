class ReportSubscription < ActiveRecord::Base
  belongs_to :report_subscriber
  belongs_to :report
end
