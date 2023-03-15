class EmploymentEvent < ApplicationRecord
  belongs_to :user
  belongs_to :employee
end
