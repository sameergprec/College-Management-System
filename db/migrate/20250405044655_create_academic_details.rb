class CreateAcademicDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :academic_details do |t|
      t.references :student, null: false, foreign_key: true
      t.float :i_sem
      t.float :ii_sem
      t.float :iii_sem
      t.float :iv_sem
      t.float :v_sem
      t.float :vi_sem
      t.float :vii_sem
      t.float :viii_sem
      t.float :cgpa

      t.timestamps
    end
  end
end
