module Nxt
  module Auth
    class EmailConfirmation
      def initialize(confirm_token:)
        @confirm_token = confirm_token
      end

      def confirm
        user.email_confirmed = true
        user.confirm_token = nil
        user.save!(validate: false)
      end

      private
      attr_reader :confirm_token

      def user
        @user ||= User.find_by!(confirm_token: confirm_token)
      end
    end
  end
end