module Nxt
  module Util
    class Http
      def self.get_email_host
        "https://#{ENV['FRONTEND_HOST']}"
      end
    end
  end
end