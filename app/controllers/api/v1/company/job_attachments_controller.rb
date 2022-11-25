module Api
  module V1
    module Company
      class JobAttachmentsController < ApiController
				before_action :authenticate_user
				before_action :set_attachment

      	def update
      		@attachment.update(attachment_params)
        
					if attachment_params[:picture].nil?
						@attachment.remove_picture!
						@attachment.update_column :picture, nil
					end  

					if attachment_params[:video].nil?
						@attachment.remove_video!
						@attachment.update_column :video, nil
					end  
					
					json(AttachmentSerializer.new(@attachment.reload))
      	end

				private
				
				def attachment_params
					params.require(:attachment).permit(
						:picture,
						:video,
						:purpose
					)
				end

				def set_attachment
					job_offer = current_profile.job_offers.find(
						params[:job_offer_id]
					)

					@attachment = job_offer.attachments.find(params[:id])
				end
      end
    end
  end
end  
