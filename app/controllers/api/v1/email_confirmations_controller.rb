module Api
  module V1
    class EmailConfirmationsController < ApiController
      def create
        confirm
        json({}, 201)
      end

      private

      def confirm
        Nxt::Auth::EmailConfirmation.new(
          confirm_token: params[:email_confirmation][:confirm_token]
        ).confirm
      end
    end
  end
end