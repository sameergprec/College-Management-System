class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student, dependent: :destroy
  has_one :teacher, dependent: :destroy
  belongs_to :department, optional: true
  enum :role, {
    student: 'student',
    teacher: 'teacher',
    department: 'department',
    admin: 'admin'
  }, validate: true, prefix: true  # <-- ✅ FIXED HERE
end
