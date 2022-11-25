class AddAditionalFieldsToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :contact_person, :string
    add_column :company_profiles, :industry_sector, :string
    add_column :company_profiles, :number_of_employees, :integer
    add_column :company_profiles, :country, :string
    add_column :company_profiles, :city, :string
    add_column :company_profiles, :street, :string
    add_column :company_profiles, :what_we_do, :text
    add_column :company_profiles, :why_we_do_it, :text
    add_column :company_profiles, :why_you_should_join_our_team, :text
    add_column :company_profiles, :special_features, :text
    add_column :company_profiles, :home_page, :string
    add_column :company_profiles, :youtube_link, :string
    add_column :company_profiles, :facebok_link, :string
    add_column :company_profiles, :twitter_link, :string
  end
end
