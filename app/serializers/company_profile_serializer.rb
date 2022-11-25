require 'json_serializer'

class CompanyProfileSerializer < JsonSerializer
  attribute :id
  attribute :name
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
  attribute :jobs_count
  attribute :attachments,         :AttachmentSerializer
  attribute :home_page
  attribute :youtube_link
  attribute :facebok_link
  attribute :twitter_link
  attribute :instagram_link
  attribute :contact_email
  attribute :profile_complete
  attribute :subject_likes,             :SubjectOfferLikeSerializer

  def jobs_count
    object.job_offers.published.count
  end
end
