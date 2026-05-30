class CreateStudentSemesters < ActiveRecord::Migration[8.0]
  def change
    create_table :student_semesters do |t|
      t.references :student, null: false, foreign_key: true
      t.integer :semester_no
      t.float :sgpa
      t.float :cgpa
      t.string :status

      t.timestamps
    end
  end
end
