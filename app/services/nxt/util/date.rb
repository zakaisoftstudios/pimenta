module Nxt
  module Util
    class Date
      def self.api_format(date)
        return date.to_time.utc.midnight.iso8601 if date&.to_time.present?
      end
    end
  end
end
