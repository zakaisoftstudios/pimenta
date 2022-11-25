class AddHighestGraduationLevelToStudentProfile < ActiveRecord::Migration[5.0]
  def change
    change_table :student_profiles do |t|
      t.remove :school
      t.integer :highest_graduation_level
    end
  end
end
