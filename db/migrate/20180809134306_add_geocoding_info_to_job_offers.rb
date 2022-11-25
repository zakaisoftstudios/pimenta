class AddGeocodingInfoToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :postal_code, :string, null: false
    add_column :job_offers, :latitude, :decimal, null: false
    add_column :job_offers, :longitude, :decimal, null: false
  end
end
