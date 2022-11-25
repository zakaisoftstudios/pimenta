module MediaAttachable
	extend ActiveSupport::Concern
	include ActiveModel::Validations

	included do 
		has_many  :attachments,
			-> { order :created_at },
			as: :attachable, 
			inverse_of: :attachable, 
			dependent: :destroy
			
		accepts_nested_attributes_for :attachments, allow_destroy: true
	end		
end	