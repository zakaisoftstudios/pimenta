module Api
  module V1
    class AccountController < ApiController
      before_action :authenticate_user
      before_action :set_profile_name

      def destroy
          current_user.profile.destroy
          current_user.destroy
          json(message: "#{@profile_name} deleted")
      end

      private

      def set_profile_name
        @profile_name = current_user.profile.class.name
      end
    end
  end
end
