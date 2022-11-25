module Nxt
  module Student
    module Search
      module Job
        class ESJobQuery
          def initialize(search_params:, student_profile:)
            @search_params = search_params
            @student_profile = student_profile
            @es_query_builder = Nxt::ElasticSearch::Filtering.new(
              filters: search_params
            )
          end
  
          TEXT_SEARCH_FIELDS = [:text_search].freeze
          TEXT_SEARCH_MATCH_CRITERIA = :word_start
          WAGE_FROM_FIELD = :wage_from
          WAGE_TO_FIELD = :wage_to
          START_DATE_FIELD = :start
          CATEGORY_FIELD = :category
          MINIMUM_DEGREE_FIELD = :minimum_degree
          WORKING_HOURS_PER_WEEK_FROM_FIELD = :working_hours_per_week_from
          WORKING_HOURS_PER_WEEK_TO_FIELD = :working_hours_per_week_to
          PUBLISHED_STATE = :published
          DISTANCE_FIELD = :distance
  
          def text_search
            @es_query_builder.text_search(fields: TEXT_SEARCH_FIELDS)
          end
  
          def where_queries
            {}
            .merge(base_filters)
            .merge(by_published)
            .merge(by_wage)
            .merge(by_minimum_degree_list)
            .merge(by_category_list)
            .merge(by_working_hours_per_week)
            .merge(by_start_date)
            .merge(by_distance)
          end
  
          def by_published
            {state: PUBLISHED_STATE}
          end
          
          def by_working_hours_per_week
            filter = { working_hours_per_week: {} }
  
            filter[:working_hours_per_week][:gte] = @search_params[WORKING_HOURS_PER_WEEK_FROM_FIELD] if (
              @search_params[WORKING_HOURS_PER_WEEK_FROM_FIELD].present?
            )
  
            filter[:working_hours_per_week][:lte] = @search_params[WORKING_HOURS_PER_WEEK_TO_FIELD] if (
              @search_params[WORKING_HOURS_PER_WEEK_TO_FIELD].present? 
            )
  
            filter
          end
  
          def by_wage
            filter = { wage: {} }
  
            filter[:wage][:gte] = @search_params[WAGE_FROM_FIELD] if (
              @search_params[WAGE_FROM_FIELD].present?
            )
  
            filter[:wage][:lte] = @search_params[WAGE_TO_FIELD] if (
              @search_params[WAGE_TO_FIELD].present? 
            )
  
            filter
          end
  
          def by_start_date
            if @search_params[START_DATE_FIELD].present?
              start_date = Date.parse(
                @search_params[START_DATE_FIELD]
              ).beginning_of_day
              
              { start: start_date...12.months.from_now.end_of_day }
            else
              default_by_start_date 
            end
    
          rescue ArgumentError 
            # case date parsing fails
            default_by_start_date
          end
    
          def default_by_start_date
            { 
              start: { lte: 12.months.from_now.end_of_day }
            }
          end
  
          def by_category_list
            if @search_params[CATEGORY_FIELD].present?
              {
                category: @search_params[CATEGORY_FIELD]
              } 
            else
              {}
            end
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