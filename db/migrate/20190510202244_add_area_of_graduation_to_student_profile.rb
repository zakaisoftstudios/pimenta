class AddAreaOfGraduationToStudentProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :student_profiles, :area_of_graduation, :string
  end
end
