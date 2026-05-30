class AcademicDetail < ApplicationRecord
  belongs_to :student
  validates :student_id, uniqueness: true
end
