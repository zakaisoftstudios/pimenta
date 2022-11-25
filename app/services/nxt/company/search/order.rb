module Nxt
  module Company
    module Search
      class Order
        BY_CREATION_DATE = 'creation_date'

        def initialize(filters:, profile:)
          @filters = filters
          @profile = profile
        end

        def by_creation_date(results)
          unless results.empty?
            return results.sort_by { |result| result.created_at }
          end
          results
        end

        def order_results(results)
          by_creation_date(results)
        end
      end
    end
  end
end
