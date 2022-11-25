module Nxt
  module Student
    module Search
      module Job
        class Search  
          def initialize(student_profile:, search_params:)
            @student_profile = student_profile
            @order = Nxt::Student::Search::Order.new(
              filters: search_params,
              profile: student_profile
            )
            @es_job_query = ESJobQuery.new(
              search_params: search_params, 
              student_profile: student_profile
            )
          end
    
          def perform
            results_on_first_year = remove_blocked(search_results[:results_on_first_year]).map do |result| 
              Result.new(
                job_offer: result, 
                student_profile: @student_profile
              )
            end
            results_out_of_first_year = remove_blocked(search_results[:results_out_of_first_year]).map do |result| 
              Result.new(
                job_offer: result, 
                student_profile: @student_profile
              )
            end
  
            order_and_concat_results(results_on_first_year, results_out_of_first_year)
          end
    
          private

          def order_and_concat_results(results_on_first_year, results_out_of_first_year)
            @order.order_results(results_on_first_year)
            .concat(@order.order_results(results_out_of_first_year))
          end

          def remove_blocked(results)
            results.select do |job_offer|
              ::Block.where(
                student_profile: @student_profile, 
                company_profile: job_offer.company_profile
              ).none?
            end
          end

          def search_results
            @search_results ||= JobOffer.search(
              @es_job_query.text_search,
              fields: ESJobQuery::TEXT_SEARCH_FIELDS,
              match: ESJobQuery::TEXT_SEARCH_MATCH_CRITERIA,
              misspellings: false,
              where: @es_job_query.where_queries.except(:start),
              order: @order.order_options
            )
            filter_one_year_ahead = Nxt::Student::Search::Filter::FilterOneYearAhead.new(
              search_results: @search_results
            ).separate
          end
        end
      end
    end
  end
end