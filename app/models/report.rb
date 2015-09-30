class Report < ActiveRecord::Base
  has_and_belongs_to_many :employees, join_table: :employees_reports
  has_and_belongs_to_many :categories, join_table: :categories_reports
  has_many :report_subscribers, through: :report_subscriptions
  has_many :report_subscriptions
  has_attached_file :main_report
  has_attached_file :charts
  has_attached_file :vid
  has_attached_file :press_release
  do_not_validate_attachment_file_type :main_report
  do_not_validate_attachment_file_type :charts
  do_not_validate_attachment_file_type :vid
  do_not_validate_attachment_file_type :press_release
end
