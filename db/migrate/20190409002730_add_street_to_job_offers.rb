class AddStreetToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :street, :string
  end
end
