module Api
  module V1
    module Admin
      module Dashboard
        class JobOffersQuantityController < ApiController
          before_action :authenticate_user, :authenticate_admin

          def index
            json(JobOffer.all.size, 200)
          end
        end
      end
    end
  end
end
