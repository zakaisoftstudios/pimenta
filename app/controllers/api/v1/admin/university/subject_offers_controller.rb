module Api
  module V1
    module Admin
      module University
        class SubjectOffersController < ApiController
          before_action :authenticate_user, :authenticate_admin
          before_action :set_subject_offer

          def destroy
            @subject_offer.destroy
            json({message: "Subject offer with id #{@subject_offer.id} deleted"})
          end

          private

          def set_subject_offer
            @subject_offer = SubjectOffer.find(params[:id])
          end
        end
      end
    end
  end
end
