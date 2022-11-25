require 'json_serializer'

class AdminUniversityProfilesSerializer < JsonSerializer
  attribute :id
  attribute :name
  attribute :created_at
  attribute :home_page
  attribute :email
  attribute :subject_offers_count
  attribute :subject_offers,      :SubjectOfferSerializer
  attribute :total_items_count
  attribute :profile_complete
  attribute :attachments,         :AttachmentSerializer
  attribute :id
  attribute :type_of_university
  attribute :name
  attribute :number_of_students
  attribute :we_are
  attribute :why_should_you_study_here
  attribute :subject_areas
  attribute :special_features
  attribute :country
  attribute :city
  attribute :postal_code
  attribute :street
  attribute :home_page
  attribute :youtube_link
  attribute :facebok_link
  attribute :twitter_link
  attribute :contact_email
  attribute :profile_complete
  attribute :attachments,         :AttachmentSerializer
  attribute :links,               :LinkSerializer
  attribute :subject_offers_count

  def email
    object.user ? object.user.email : object.contact_email
  end

  def subject_offers_count
    object.subject_offers.count
  end
end
