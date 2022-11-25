class CreateStudentProfileSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :student_profile_subjects do |t|
      t.references :student_profile, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
