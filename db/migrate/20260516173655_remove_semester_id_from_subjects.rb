class RemoveSemesterIdFromSubjects < ActiveRecord::Migration[8.0]
  def change
    remove_reference :subjects, :semester, foreign_key: true
  end
end
