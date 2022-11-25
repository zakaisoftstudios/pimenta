class AddPictureToCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :picture, :string
  end
end
