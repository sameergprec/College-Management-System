class CreateDepartmentSemesters < ActiveRecord::Migration[8.0]
  def change
    create_table :department_semesters do |t|
      t.references :department, null: false, foreign_key: true
      t.integer :semester_no

      t.timestamps
    end
  end
end
