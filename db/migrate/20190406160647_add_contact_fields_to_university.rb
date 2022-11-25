class AddContactFieldsToUniversity < ActiveRecord::Migration[5.0]
  def change
    add_column :university_profiles, :home_page, :string
    add_column :university_profiles, :youtube_link, :string
    add_column :university_profiles, :facebok_link, :string
    add_column :university_profiles, :twitter_link, :string
    add_column :university_profiles, :contact_email, :string
  end
end
