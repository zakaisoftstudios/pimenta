class CreateStudentProfileInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :student_profile_interests do |t|
      t.references :interest, foreign_key: true
      t.references :student_profile, foreign_key: true

      t.timestamps
    end
  end
end
