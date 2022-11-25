module Api
  module V1
  	class AttachmentsController < ApiController
      before_action :authenticate_user
  		before_action :set_attachment,      only: [:destroy, :update]

  		def index
        if params[:job_offer_id].present? 
          @attachments = JobOffer.find(params[:job_offer_id]).attachments
        else
          @attachments = current_user.profile.attachments
        end  

        json(AttachmentSerializer.new(@attachments))
  		end

  		def create
        attachment = current_profile.attachments.create(attachment_params)
        json(AttachmentSerializer.new(attachment.reload), :created)          			
  		end

  		def destroy
  			@attachment.destroy
        json({}, :no_content)
  		end

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
        if params[:job_offer_id].present? 
          @attachment = JobOffer.find(
            params[:job_offer_id]
          ).attachments.find(params[:id])
        elsif params[:subject_offer_id].present? 
          @attachment = SubjectOffer.find(
            params[:subject_offer_id]
          ).attachments.find(params[:id])
        else
          @attachment = current_profile.attachments.find(params[:id])
        end  
      end
  	end
  end
end
