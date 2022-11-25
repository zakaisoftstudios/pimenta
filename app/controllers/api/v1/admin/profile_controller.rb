module Api
  module V1
    module Admin
      class ProfileController < ApiController
        before_action :authenticate_user, :authenticate_admin

        def index
          json(AdminProfileSerializer.new(current_profile))
        end
      end
    end
  end
end
