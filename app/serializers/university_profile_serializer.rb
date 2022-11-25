require 'json_serializer'

class UniversityProfileSerializer < JsonSerializer
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

   def subject_offers_count
      object.subject_offers.where(state: 'published').count
   end
end      
