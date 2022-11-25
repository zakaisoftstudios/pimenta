module Nxt
  module Student
    module Search
      module Subject
        class Search  
          def initialize(student_profile:, search_params:)
            @student_profile = student_profile
            @order = Nxt::Student::Search::Order.new(
              filters: search_params, 
              profile: student_profile
            )
            @es_subject_query = ESSubjectQuery.new(
              search_params: search_params, 
              student_profile: student_profile
            )
          end
    
          def perform
            results = search_results.map do |result| 
              Result.new(
                subject_offer: result, 
                student_profile: @student_profile
              )
            end

            @order.order_results(results)
          end
    
          private

          # def search_results
          #   filtering
          #   .non_blocked_filter(elastic_search_results)
          #   .map do |result| 
          #     Result.new(
          #       job_offer: result, 
          #       student_profile: student_profile
          #     )
          #   end
          # end

          def search_results
            @search_results ||= ::SubjectOffer.search(
              @es_subject_query.text_search,
              fields: ESSubjectQuery::TEXT_SEARCH_FIELDS,
              match: ESSubjectQuery::TEXT_SEARCH_MATCH_CRITERIA,
              misspellings: false,
              where: @es_subject_query.where_queries,
              order: @order.order_options
            )
          end
        end
      end
    end
  end
end