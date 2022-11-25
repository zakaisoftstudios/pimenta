class AddGeocodeInfoToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :postal_code, :string
    add_column :company_profiles, :latitude, :decimal
    add_column :company_profiles, :longitude, :decimal
  end
end
