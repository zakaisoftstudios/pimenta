class RemoveUnecessaryFieldsFromStudentProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :student_profiles, :from_your_latest
    remove_column :student_profiles, :mobile_number
  end
end
