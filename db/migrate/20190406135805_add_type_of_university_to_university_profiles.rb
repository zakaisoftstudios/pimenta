class AddTypeOfUniversityToUniversityProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :university_profiles, :type_of_university, :integer
  end
end
