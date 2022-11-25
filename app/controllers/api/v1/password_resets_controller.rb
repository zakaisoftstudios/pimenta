module Api
  module V1
    class PasswordResetsController < ApiController

			def create
				lang = request.headers["Accept-Language"]
				lo = I18n.locale

				user = User.find_by_email(user_params_for_create[:email])

				if user.blank? || user.facebook_id || !user.email_confirmed
					json({
						error: I18n.t('controllers.api.v1.password_resets.not_found')}, 
						400
					)
				else
					user.send_password_reset_token
					json({success: true}, 201)
				end      	
      end

			def update
				json(
					{error: I18n.t('controllers.api.v1.password_resets.not_found')}, 400
				) if params[:id].blank?

      	user = User.find_by_password_reset_token(params[:id])
				
				if user.present?
					user.update!(
						password: user_params_for_update[:password],
						password_confirmation:		user_params_for_update[
							:password_confirmation
						],
						password_reset_token: nil,
						password_reset_sent_at: nil
					)

					UserMailer.password_updated(user).deliver_later
					
      		json({success: true}, 200)
      	else
      		json({error: I18n.t('controllers.api.v1.password_resets.not_found')}, 400)
      	end
      end

      private

      def user_params_for_create
        params.require(:user).permit(
          :email
        )
			end
			
			def user_params_for_update
        params.require(:user).permit(
          :password, :password_confirmation
        )
      end
    end  
  end
end