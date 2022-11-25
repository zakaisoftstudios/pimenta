require 'json_serializer'

class CertificateSerializer < JsonSerializer
  attribute :id
  attribute :pdf
  attribute :student_profile_id
  attribute :title
  attribute :finished_at
  attribute :institution_name

  def pdf
    object.pdf.url
  end
end
