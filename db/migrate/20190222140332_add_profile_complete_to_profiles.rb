class AddProfileCompleteToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :student_profiles, :profile_complete, :boolean, default: false
    add_column :company_profiles, :profile_complete, :boolean, default: false
  end
end
