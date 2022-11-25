class AddWebSiteLinkToSubjectOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_offers, :web_site_link, :string
  end
end
