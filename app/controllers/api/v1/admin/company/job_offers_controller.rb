module Api
  module V1
    module Admin
      module Company
        class JobOffersController < ApiController
          before_action :authenticate_user, :authenticate_admin
          before_action :set_job_offer

          def destroy
            @job_offer.destroy
            json({message: "Job offer with id #{@job_offer.id} deleted"})
          end

          private

          def set_job_offer
            @job_offer = JobOffer.find(params[:id])
          end
        end
      end
    end
  end
end
