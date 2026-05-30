class CreateExternalMarks < ActiveRecord::Migration[8.0]
  def change
    create_table :external_marks do |t|
      t.references :subject, null: false, foreign_key: true
      t.integer :external_exam
      t.float :final_total
      t.string :grade
      t.float :gpa
      t.string :result

      t.timestamps
    end
  end
end
