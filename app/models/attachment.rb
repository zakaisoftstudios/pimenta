class Attachment < ApplicationRecord
	mount_base64_uploader :picture, AttachmentPictureUploader
	mount_base64_uploader :video, 	AttachmentVideoUploader

  belongs_to :attachable,	polymorphic: true

  enum purpose: [:regular, :cover, :avatar, :about, :video, :main]

  scope :pictures,	-> { where.not(picture: nil) }
  scope :videos,		-> { where.not(video: nil) }

  before_save :set_purpose_uniqueness
  before_save :set_purpose_as_regular_if_not_specified

  def regular?
  	purpose == 'regular' || purpose.nil?
  end

  private

  def set_purpose_as_regular_if_not_specified
    self.purpose = :regular if purpose.nil?
  end

  def set_purpose_uniqueness
  	if attachable.instance_of?(CompanyProfile) && !regular?
  		attachable.attachments.where(purpose: purpose)
  		.where.not(id: id).update_all(purpose: :regular)
  	end
  end
end
