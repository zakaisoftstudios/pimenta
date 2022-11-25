class AddVideoToCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :video, :string
  end
end
