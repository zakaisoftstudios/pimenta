class AddAditionalFieldsToStudentProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :student_profiles, :picture, :string
    add_column :student_profiles, :date_of_birth, :date
    add_column :student_profiles, :sex, :integer
    add_column :student_profiles, :country, :string
    add_column :student_profiles, :city, :string
    add_column :student_profiles, :street, :string
    add_column :student_profiles, :graduation, :string
    add_column :student_profiles, :grade_point_average, :decimal
    add_column :student_profiles, :from_your_latest, :string
    add_column :student_profiles, :available_from, :date
    add_column :student_profiles, :mobile_number, :string
    add_column :student_profiles, :driving_license, :string
    add_column :student_profiles, :mobility, :integer
    add_column :student_profiles, :other_skills_and_interests, :text
  end
end
