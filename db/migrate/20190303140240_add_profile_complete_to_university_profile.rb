class AddProfileCompleteToUniversityProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :university_profiles, :profile_complete, :boolean, default: false
  end
end
