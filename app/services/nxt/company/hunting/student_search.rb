module Nxt
  module Company
    module Hunting
      class StudentSearch
        def initialize(company_profile:, search_params:)
          @company_profile = company_profile
          @search_params = search_params
          
          @es_student_query = ESStudentQuery.new(
            filters: search_params, 
            company_profile: company_profile
          )
          
          @es_results_order = ESResultsOrder.new(
            company_profile: company_profile
          )
        end

        def perform
          remove_blocked(completed_profiles_results).map do |result|
            Result.new(
              student_profile: result,
              company_profile: @company_profile,
              filters: @search_params
            )
          end
        end

        private

        def search_results
          @search_results ||= StudentProfile.search(
            @es_student_query.text_search,
            fields: ESStudentQuery::TEXT_SEARCH_FIELDS,
            match: ESStudentQuery::TEXT_SEARCH_MATCH_CRITERIA,
            misspellings: false,
            order: @es_results_order.by_distance,
            where: @es_student_query.where_queries
          )
        end

        def remove_blocked(search_results)
          search_results.select do |student_profile|
            ::Block.where(
              student_profile: student_profile,
              company_profile: @company_profile
            ).none?
            end
        end

        def completed_profiles_results
          search_results.select{|student_profile| student_profile.profile_complete }
        end
      end
    end
  end
end
