class AddContactEmailToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :contact_email, :string
  end
end
