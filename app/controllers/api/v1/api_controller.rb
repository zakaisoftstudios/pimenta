module Api
  module V1
    # Main controller for the V1 API
    class ApiController < ActionController::API
      include HttpAcceptLanguage::AutoLocale
      include ApiResponse
      include ApiExceptionHandler
      include Knock::Authenticable
      include Pagination

      def current_profile
      	current_user.profile
      end

      def authenticate_admin
        raise Nxt::Admin::Errors::UserIsNotAdmin.new unless current_user.is_admin?
      end
    end
  end
end
