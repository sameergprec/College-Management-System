class DepartmentSemester < ApplicationRecord
  belongs_to :department
  has_many :subjects
end
