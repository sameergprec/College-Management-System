class AddDepartmentSemesterToSubjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :subjects,
     :department_semester,
    foreign_key: true
  end
end
