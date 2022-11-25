class AddGeocodeInfoToStudentProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :student_profiles, :postal_code, :string
    add_column :student_profiles, :latitude, :decimal
    add_column :student_profiles, :longitude, :decimal
  end
end
