class RemoveCompanyProfileIdFromProfileImage < ActiveRecord::Migration[5.0]
  def change
    remove_column :profile_images, :company_profile_id
  end
end
