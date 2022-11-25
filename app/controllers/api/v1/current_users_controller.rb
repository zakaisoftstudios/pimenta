module Api
  module V1
    class CurrentUsersController < ApiController
      before_action :authenticate_user

      def show
        json(UserSerializer.new(current_user, user_token))
      end

      private

      def user_token
        Nxt::Auth::Token.for(current_user)
      end
    end
  end
end