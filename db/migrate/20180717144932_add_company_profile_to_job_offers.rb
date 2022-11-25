class AddCompanyProfileToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_reference :job_offers, :company_profile, foreign_key: true, null: false
  end
end
