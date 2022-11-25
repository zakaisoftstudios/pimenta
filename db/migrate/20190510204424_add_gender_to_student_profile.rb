class AddGenderToStudentProfile < ActiveRecord::Migration[5.0]
  def change
    change_table :student_profiles do |t|
      t.remove :sex
      t.integer :gender, default: 0
    end
  end
end
