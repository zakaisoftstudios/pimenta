module Api
  module V1
    module Student
      class BlocksController < ApiController
        before_action :authenticate_user
        
        def create
          block = block_service.create
          json(BlockSerializer.new(block), 201)
        end

        private

        def block_service
          company_profile = CompanyProfile.find(
            params[:block][:company_profile_id]
          )

          @block_service ||= Nxt::Student::Block.new(
            student_profile: current_user.profile,
            company_profile: company_profile
          )
        end
      end
    end
  end
end