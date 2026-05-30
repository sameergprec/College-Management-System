class Department < ApplicationRecord
  has_many :students
  has_many :teachers
  has_many :users, dependent: :nullify
  has_many :department_semesters
end
