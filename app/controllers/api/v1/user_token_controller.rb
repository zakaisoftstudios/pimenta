module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      include ApiResponse
      include HttpAcceptLanguage::AutoLocale

      def create
        if entity.email_confirmed
          super
        else
          error_response(
            I18n.t('controllers.api.v1.user_token.email_not_confimed')
          )
        end
      end

      private

      def authenticate
        unless entity.present? && entity.authenticate(auth_params[:password])
          error_response(
            I18n.t('controllers.api.v1.user_token.invalid_credentials')
          )
        end
      end
    end 
  end
end