class ChangeStudentTypeOfGraduation < ActiveRecord::Migration[5.0]
  def up
    change_table :student_profiles do |t|
      t.remove :type_of_graduation
      t.integer :type_of_graduation, default: 0
    end
  end
end
