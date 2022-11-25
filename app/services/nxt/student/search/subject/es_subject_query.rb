module Nxt
  module Student
    module Search
      module Subject
        class ESSubjectQuery
          def initialize(search_params:, student_profile:)
            @search_params = search_params
            @student_profile = student_profile
            @es_query_builder = Nxt::ElasticSearch::Filtering.new(
              filters: search_params
            )
          end
  
          TEXT_SEARCH_FIELDS = [:text_search].freeze
          TEXT_SEARCH_MATCH_CRITERIA = :word_start
          PUBLISHED_STATE = :published
          COST_AMOUNT_FROM_FIELD = :cost_amount_from
          COST_AMOUNT_TO_FIELD = :cost_amount_to
          NUMMERUS_CLAUSUS_FIELD = :nummerus_clausus
          DURATION_IN_HOURS_FROM_FIELD = :duration_in_hours_from
          DURATION_IN_HOURS_TO_FIELD = :duration_in_hours_to
          START_DATE_FIELD = :start_date
          MINIMUM_DEGREE_FIELD = :minimum_degree
          TYPE_OF_DEGREE_FIELD = :type_of_degree
          DISTANCE_FIELD = :distance
  
          def text_search
            @es_query_builder.text_search(fields: TEXT_SEARCH_FIELDS)
          end
  
          def where_queries
            {}
            .merge(base_filters)
            .merge(by_published)
            .merge(by_cost_amount)
            .merge(by_nummerus_clausus)
            .merge(by_start_date)
            .merge(by_minimum_degree_list)
            .merge(by_type_of_degree_list)
            .merge(by_distance)
          end

          def by_published
            {state: PUBLISHED_STATE}
          end
  
          def by_distance
            @es_query_builder.distance_filter(
              field: DISTANCE_FIELD, origin: @student_profile
            )
          end

          def by_cost_amount
            filter = { cost_amount: {} }
  
            filter[:cost_amount][:gte] = @search_params[COST_AMOUNT_FROM_FIELD] if (
              @search_params[COST_AMOUNT_FROM_FIELD].present?
            )
  
            filter[:cost_amount][:lte] = @search_params[COST_AMOUNT_TO_FIELD] if (
              @search_params[COST_AMOUNT_TO_FIELD].present? 
            )
  
            filter
          end

          def by_nummerus_clausus
            filter = { nummerus_clausus: {} }
            
            filter[:nummerus_clausus][:lte] = @search_params[
              NUMMERUS_CLAUSUS_FIELD
            ] if @search_params[NUMMERUS_CLAUSUS_FIELD].present?

            filter
          end

          def by_duration_in_hours
            filter = { duration_in_hours: {} }
  
            filter[:duration_in_hours][:gte] = @search_params[
              DURATION_IN_HOURS_FROM_FIELD
            ] if @search_params[DURATION_IN_HOURS_FROM_FIELD].present?
  
            filter[:duration_in_hours][:lte] = @search_params[
              DURATION_IN_HOURS_TO_FIELD
            ] if @search_params[DURATION_IN_HOURS_TO_FIELD].present?
  
            filter
          end

          def by_start_date
            if @search_params[START_DATE_FIELD].present?
              start_date = Date.parse(
                @search_params[START_DATE_FIELD]
              ).beginning_of_day
              
              { start_date: start_date...2.years.from_now.end_of_day }
            else
              default_by_start_date 
            end 
    
          rescue ArgumentError 
            # case date parsing fails
            default_by_start_date
          end
    
          def default_by_start_date
            { 
              start_date: { lte: 2.years.from_now.end_of_day }
            }
          end
    
          def by_minimum_degree_list
            if @search_params[MINIMUM_DEGREE_FIELD].present?
              {
                minimum_degree: @search_params[MINIMUM_DEGREE_FIELD]
              } 
            else
              {}
            end
          end
          
          def by_type_of_degree_list
            if @search_params[TYPE_OF_DEGREE_FIELD].present?
              {
                type_of_degree: @search_params[TYPE_OF_DEGREE_FIELD]
              } 
            else
              {}
            end
          end

          def by_distance
            @es_query_builder.distance_filter(
              field: DISTANCE_FIELD, origin: @student_profile
            )
          end

          def base_filters
            {
              _or: [
                { skill_ids: @student_profile.skills.pluck(:id) },
                { interest_ids: @student_profile.interests.pluck(:id) },
                { strength_ids: @student_profile.strengths.pluck(:id) }
              ]
            }
          end
        end
      end
    end
  end
end