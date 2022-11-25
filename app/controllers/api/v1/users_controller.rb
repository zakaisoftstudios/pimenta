module Api
  module V1
    class UsersController < ApiController
      before_action :not_admin?

      def create
        json(UserSerializer.new(created_profile.user, nil), 201)
      end

      private

      def not_admin?
        raise Nxt::Admin::Errors::ForbiddenCreateAdmin.new('Not authorized') if profile_params[:profile_type] == 'AdminProfile'
      end

      def user_params
        params.require(:user).permit(
          :email, :password, :password_confirmation
        )
      end

      def profile_params
        params.require(:user).permit(
          :name, :profile_type, :facebook_id
        )
      end

      def created_profile
        @created_profile ||= Nxt::Auth::SignUp.new(
          user_data: user_params,
          profile_data: profile_params
        ).perform
      end
    end
  end
end