class AddCountryToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :country, :string, null: false
  end
end
