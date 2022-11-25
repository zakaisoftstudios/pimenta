module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      reject_unauthorized_connection unless request.params[:token]
      verified_user || reject_unauthorized_connection
    end

    def auth_token
      Knock::AuthToken.new(token: request.params[:token])
    rescue JWT::DecodeError
      reject_unauthorized_connection
    end

    def verified_user
      User.find_by(id: auth_token.payload['sub'])
    end
  end
end
