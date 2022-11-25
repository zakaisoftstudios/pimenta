module Nxt
  module Company
    module Hunting
      class MatchingPercentage
        attr_reader :student_profile, :filters

        MAX_QUALITY_CATEGORIES = 3
        MAX_PERCENTAGE = 100

        def initialize(filters:, student_profile:)
          @filters = filters
          @student_profile = student_profile
        end

        def calculate
          match_percentages_sum = [:skill, :interest, :strength].reduce(0) do |sum, quality_category|
            sum += quality_match_percentage(quality_category) if 
              quality_filters["#{quality_category}_ids"].present?

            sum
          end

          if quality_filters_category_count > 0
            match_percentages_sum / quality_filters_category_count
          else
            nil
          end
        end

        private



        def quality_match_percentage(quality_category)
          (
            quality_matches(quality_category) * MAX_PERCENTAGE
          ) / quality_filters_count(quality_category)
        end

        def quality_matches(quality_category)
          (
            student_profile.send("#{quality_category}s").pluck(:id) & quality_filters["#{quality_category}_ids"].map(&:to_i)
          ).count
        end

        def quality_filters_count(quality_category)
          quality_filters["#{quality_category}_ids"].size
        end

        def quality_filters
          @qualities_filter ||= filters.slice(
            :skill_ids, :interest_ids, :strength_ids
          )
        end

        def quality_filters_category_count
          @quality_filters_category_count ||= quality_filters.keys.count
        end
      end
    end
  end
end