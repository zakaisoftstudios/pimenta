module Nxt
  module Company
    module Hunting
      class ESStudentQuery
        TEXT_SEARCH_FIELDS = [:text_search].freeze
        TEXT_SEARCH_MATCH_CRITERIA = :word_start
        AGE_FROM_FIELD = :age_from
        AGE_TO_FIELD = :age_to
        GRADE_POINT_AVERAGE_FIELD = :grade_point_average
        GENDER_FIELD = :gender
        MOBILITY_FIELD = :mobility
        DISTANCE_FIELD = :distance
        EDUCATIONAL_LEVEL_FIELD = :educational_level
        SKILL_IDS_FIELD = :skill_ids
        INTEREST_IDS_FIELD = :interest_ids
        STRENGTH_IDS_FIELD = :strength_ids

        def initialize(filters:, company_profile:)
          @filters = filters
          @es_query_builder = Nxt::ElasticSearch::Filtering.new(
            filters: filters
          )
          @company_profile = company_profile
        end

        def text_search
          t = @es_query_builder.text_search(fields: TEXT_SEARCH_FIELDS)
        end

        def where_queries
          {}
          .merge(by_age)
          .merge(by_grade_point_average)
          .merge(by_gender_list)
          .merge(by_mobility_list)
          .merge(by_distance)
          .merge(by_educational_level_list)
          .merge(by_skill_id_list)
          .merge(by_interest_id_list)
          .merge(by_strength_id_list)
        end

        private

        def by_age
          filter = { age: {} }

          filter[:age][:gte] = @filters[AGE_FROM_FIELD] if @filters[AGE_FROM_FIELD].present?

          filter[:age][:lte] = @filters[AGE_TO_FIELD] if @filters[AGE_TO_FIELD].present? 

          filter
        end

        def by_grade_point_average
          @es_query_builder.lower_than_filters(
            fields: [GRADE_POINT_AVERAGE_FIELD]
          )
        end

        def by_gender_list
          if @filters[GENDER_FIELD].present?
            {
              gender: @filters[GENDER_FIELD]
            } 
          else
            {}
          end
        end
        
        def by_mobility_list
          if @filters[MOBILITY_FIELD].present?
            {
              mobility: @filters[MOBILITY_FIELD]
            } 
          else
            {}
          end
        end

        def by_distance
          @es_query_builder.distance_filter(
            field: DISTANCE_FIELD, origin: @company_profile
          )
        end

        def by_educational_level_list
          if @filters[EDUCATIONAL_LEVEL_FIELD].present?
            {
              educational_levels: {all: @filters[EDUCATIONAL_LEVEL_FIELD]}
            } 
          else
            {}
          end
        end

        def by_skill_id_list
          if @filters[SKILL_IDS_FIELD].present?
            {
              skill_ids: {all: @filters[SKILL_IDS_FIELD]} 
            } 
          else
            {}
          end
        end
        
        def by_interest_id_list
          if @filters[INTEREST_IDS_FIELD].present?
            {
              interest_ids: {all: @filters[INTEREST_IDS_FIELD]} 
            } 
          else
            {}
          end
        end
        
        def by_strength_id_list
          if @filters[STRENGTH_IDS_FIELD].present?
            {
              strength_ids: {all: @filters[STRENGTH_IDS_FIELD]} 
            } 
          else
            {}
          end
        end
      end
    end
  end
end
