class CreateSubjects < ActiveRecord::Migration[8.0]
  def change
    create_table :subjects do |t|
      t.references :semester, null: false, foreign_key: true
      t.string :subject_code
      t.string :subject_name
      t.integer :credits
      t.string :subject_type

      t.timestamps
    end
  end
end
