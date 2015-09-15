class Role < ActiveRecord::Base
  has_and_belongs_to_many :employees, join_table: :employees_roles
end
