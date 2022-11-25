class CreateStudentProfileStrengths < ActiveRecord::Migration[5.0]
  def change
    create_table :student_profile_strengths do |t|
      t.references :student_profile, foreign_key: true
      t.references :strength, foreign_key: true

      t.timestamps
    end
  end
end
