module Nxt
  module Auth
    class Token
      def self.for(user)
        Knock::AuthToken.new(payload: { sub: user.id }).token
      end
    end
  end  
end