class AddWebSiteLinkToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :web_site_link, :string
  end
end
