class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :roll_no
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.date :dob
      t.integer :semester
      t.string :section
      t.string :course
      t.string :scheme
      t.text :address
      t.references :user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
