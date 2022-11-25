module Api::V1
  class FacebookUserTokensController < Knock::AuthTokenController
    include HttpAcceptLanguage::AutoLocale
    
		before_action :set_entity
		before_action :authenticate

		def create
			render json: auth_token, status: :created
		end

		private

		def authenticate
			render(json: {
        error: I18n.t('controllers.api.v1.facebook_user.not_found')
      }, status: :not_found) if @entity.nil?
		end

		def auth_token
			if @entity.respond_to?(:to_token_payload)
	      Knock::AuthToken.new(payload: @entity.to_token_payload)
	    else
	      Knock::AuthToken.new(payload: { sub: @entity.id })
	    end
		end

    def set_entity
      ActiveRecord::Base.transaction do
        @entity =
        if Nxt::Auth::FacebookService.valid_token?(auth_params[:access_token])
          data = Nxt::Auth::FacebookService.fetch_data(auth_params[:access_token])
          
          user = User.find_by(email: data['email'])

          if user
            user.update(facebook_id: data['id'])
          else	
            if params[:auth][:profile_type].present? && params[:auth][:profile_type] != 'AdminProfile'
              user_data = {
                facebook_id: data['id'],
                email: data['email'],
                email_confirmed: true
              }

              profile_data = { 
                name: "#{data['first_name']} #{data['last_name']}",
                user: user,
                profile_type: params[:auth][:profile_type],
                avatar: data['picture']['data']['url']
              }

              created_profile = Nxt::Auth::SignUp.new(
                  user_data:    user_data,
                  profile_data: profile_data
                ).perform

              user = created_profile.user
            end
          end

          user
        end
      end
    end

   	def auth_params
   		params.require(:auth).permit(:access_token)
  	end
  end
end	