class RemoveUnusedUniversityFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :university_profiles, :contact_person
    remove_column :university_profiles, :industry_sector
    remove_column :university_profiles, :why_we_do_it
    remove_column :university_profiles, :partners
  end
end
