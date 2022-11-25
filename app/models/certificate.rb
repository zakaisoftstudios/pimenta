class Certificate < ApplicationRecord
  mount_base64_uploader :pdf, CertificatePdfUploader

  belongs_to :student_profile

  validates :student_profile_id, presence: true
  validates :pdf, presence: true
  validates :title, presence: true
end
