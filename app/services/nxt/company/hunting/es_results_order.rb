module Nxt
  module Company
    module Hunting
      class ESResultsOrder
        attr_accessor :company_profile

        def initialize(company_profile:)
          @company_profile = company_profile
        end

        def by_distance  
          { _geo_distance: {
            location: {
              lat: company_profile.latitude, 
              lon: company_profile.longitude
            },
            order: :asc,
            unit: :km,
            distance_type: :plane
          }}
        end
      end
    end
  end
end