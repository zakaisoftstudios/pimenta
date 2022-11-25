module Nxt
  module Student
    module Search
      class Order
        BY_DISTANCE = 'distance'
        BY_MATCH = 'match'
        BY_START_DATE = 'start_date'

        def initialize(filters:, profile:)
          @filters = filters
          @profile = profile
        end

        def by_match(results)
          if @filters[:order_by].present? && 
            @filters[:order_by] == BY_MATCH
            results.sort_by { |result| result.match_percentage }.reverse
          else
            results
          end
        end

        def by_date(results)
          unless results.empty?
            return results.sort_by { |result| [result.start, -result.match_percentage] } if results.last.class == Nxt::Student::Search::Job::Result
            return results.sort_by { |result| [result.start_date, -result.match_percentage] } if results.last.class == Nxt::Student::Search::Subject::Result
          end
          results
        end

        def order_results(results)
          if @filters[:order_by].present?
            return by_date(results) if @filters[:order_by] == BY_START_DATE
            return by_match(results) if @filters[:order_by] == BY_MATCH
          end
          results
        end

        def order_options
          if @filters[:order_by].present? && 
              @filters[:order_by] == BY_DISTANCE
            { _geo_distance: {
              location: {
                lat: @profile.latitude, 
                lon: @profile.longitude
              },
              order: :asc,  
              unit: :km,
              distance_type: :plane
            }}
          else
            {}
          end
        end
      end
    end
  end
end