class CreateStudentMarks < ActiveRecord::Migration[8.0]
  def change
    create_table :student_marks do |t|
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.integer :i1_assignment
      t.integer :i1_assessment
      t.integer :i1_ethics
      t.integer :i1_classwork
      t.float :i1_total
      t.integer :i2_assignment
      t.integer :i2_assessment
      t.integer :i2_ethics
      t.integer :i2_classwork
      t.float :i2_total
      t.float :best_internal
      t.float :least_internal
      t.float :final_internal
      t.integer :external_exam
      t.float :final_total
      t.string :grade
      t.float :gpa
      t.string :result

      t.timestamps
    end
  end
end
