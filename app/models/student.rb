class Student < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_one :academic_detail, dependent: :destroy
  validates :user_id, uniqueness: true
  has_one_attached :profile_picture
  has_many :semesters

  has_many :student_marks
end
