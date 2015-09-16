class Report < ActiveRecord::Base
  has_and_belongs_to_many :employees, join_table: :employees_reports
  has_and_belongs_to_many :categories, join_table: :categories_reports
  has_attached_file :main_report, content_type: { content_type: "application/pdf" }
  has_attached_file :charts, content_type: {content_type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"}
  has_attached_file :vid, content_type: { content_type: "video/mp4" }
  has_attached_file :press_release, content_type: { content_type: "application/pdf" }
  do_not_validate_attachment_file_type :main_report
  do_not_validate_attachment_file_type :charts
  do_not_validate_attachment_file_type :vid
  do_not_validate_attachment_file_type :press_release
end
