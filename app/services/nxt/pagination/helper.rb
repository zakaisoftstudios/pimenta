module Nxt
  module Pagination
    module Helper
      def self.add_total_items_count(items:, total_items_count:)
        items.each { |item| item.total_items_count = total_items_count }
      end
    end
  end
end