class AddInstagramLinkToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :instagram_link, :string
  end
end
