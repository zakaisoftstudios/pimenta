require 'json_serializer'

class AttachmentSerializer < JsonSerializer
	attribute :id
	attribute :picture_url
	attribute :video_url
	attribute :purpose

	def picture_url
		object.try(:picture).try(:url)
	end

	def video_url
		object.try(:video).try(:url)
	end
end	
