class RemovePictureFromStudentProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :student_profiles, :picture
  end
end
