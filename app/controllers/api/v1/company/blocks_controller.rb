module Api
  module V1
    module Company
      class BlocksController < ApiController
        before_action :authenticate_user
        
        def create
          json(BlockSerializer.new(new_block), 201)
        end

        private

        def new_block
          Nxt::Company::Block::Creator.new(
            student_profile_id: params[:block][:student_profile_id],
            company_profile: current_user.profile 
          ).create
        end
      end
    end
  end
end