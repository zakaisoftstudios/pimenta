class ChangeUniversityNumberOfEmployees < ActiveRecord::Migration[5.0]
  def change
    rename_column :university_profiles, :number_of_employees, :number_of_students
  end
end
