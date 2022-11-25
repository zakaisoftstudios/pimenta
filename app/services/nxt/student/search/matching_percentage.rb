module Nxt
  module Student
    module Search
      class MatchingPercentage
        MUST_MATCH_WEIGHT = 3
        CAN_MATCH_WEIGHT = 1
        MAX_POINTS = 60
        MAX_PERCENTAGE = 100

        def initialize(profile:, offer:, offer_key:)
          @profile = profile
          @offer = offer  
          @offer_key = offer_key
        end

        def calculate
          (achieved_points * MAX_PERCENTAGE).to_f / max_possible_points 
        end

        private

        def achieved_points
          must_match_points + can_match_points
        end

        def must_match_points
          matches_count(must_have: true) * MUST_MATCH_WEIGHT
        end

        def can_match_points
          matches_count(must_have: false) * CAN_MATCH_WEIGHT
        end

        def matches_count(must_have:)
          [:skill, :interest, :strength].reduce(0) do |count, quality|
            count += (
              offer_qualities_to_match(
                quality: quality, 
                must_have: must_have
              ) & 
              profile_qualities_to_match(quality: quality)
            ).count

            count
          end
        end

        def offer_qualities_to_match(quality:, must_have:)
          @offer.send(
            "#{@offer_key}_#{quality}s"
          ).select do |item|
            item.must_have == must_have
          end.map(&:"#{quality}")
        end

        def profile_qualities_to_match(quality:)
          @profile.send("#{quality}s")
        end

        def max_possible_points
          [:skill, :interest, :strength].reduce(0) do |points, quality|
            points += (
              max_possible_must_have_points(quality) + max_possible_can_have_points(quality)
            )

            points
          end
        end

        def max_possible_must_have_points(quality)
          offer_qualities_to_match(quality: quality, must_have: true).count *
            MUST_MATCH_WEIGHT
        end
        
        def max_possible_can_have_points(quality)
          offer_qualities_to_match(quality: quality, must_have: false).count *
            CAN_MATCH_WEIGHT
        end
      end
    end
  end
end