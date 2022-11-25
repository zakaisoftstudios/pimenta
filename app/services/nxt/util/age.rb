module Nxt
  module Util
    class Age
      def self.calculate(date_of_birth:)
        ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
      end
    end
  end
end