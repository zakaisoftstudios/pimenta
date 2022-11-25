require 'json_serializer'

class AdminCompanyProfilesSerializer < JsonSerializer
  attribute :id
  attribute :name
  attribute :email
  attribute :created_at
  attribute :contact_person
  attribute :industry_sector
  attribute :number_of_employees
  attribute :country
  attribute :city
  attribute :postal_code
  attribute :street
  attribute :what_we_do
  attribute :why_we_do_it
  attribute :why_you_should_join_our_team
  attribute :special_features
  attribute :job_offers_count
  attribute :attachments,         :AttachmentSerializer
  attribute :home_page
  attribute :youtube_link
  attribute :facebok_link
  attribute :twitter_link
  attribute :instagram_link
  attribute :contact_email
  attribute :profile_complete
  attribute :subject_likes,             :SubjectOfferLikeSerializer
  attribute :total_items_count
  attribute :job_offers,          :JobOfferSerializer

  def job_offers_count
    object.job_offers.published.count
  end

  def email
    object.user ? object.user.email : object.contact_email
  end
end
