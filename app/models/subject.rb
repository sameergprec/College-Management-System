class Subject < ApplicationRecord
  belongs_to :department_semester
  has_one :internal_mark
  has_one :external_mark

  has_many :student_marks
end
