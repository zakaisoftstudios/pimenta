class AddVideoToStudentProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :student_profiles, :video, :string
  end
end
