require 'json_serializer'

class ProfileSerializer < JsonSerializer
  attribute :id
  attribute :name
  attribute :jobs_count
  attribute :profile_complete
  attribute :attachments, :AttachmentSerializer

  def jobs_count
    object.job_offers.published.count if object.respond_to?(:job_offers)
  end
end
