module Nxt
  module Company
    module Search
      module Subject
        class Search  
          def initialize(company_profile:, search_params:)
            @company_profile = company_profile
            @order = Nxt::Company::Search::Order.new(
              filters: search_params, 
              profile: company_profile
            )
            @es_subject_query = ESSubjectQuery.new(
              search_params: search_params,
              company_profile: company_profile
            )
          end
    
          def perform
            results = search_results.map do |result| 
              Result.new(
                subject_offer: result, 
                company_profile: @company_profile
              )
            end

            @order.order_results(results)
          end
    
          private

          def search_results
            @search_results ||= ::SubjectOffer.search(
              @es_subject_query.text_search,
              fields: ESSubjectQuery::TEXT_SEARCH_FIELDS,
              match: ESSubjectQuery::TEXT_SEARCH_MATCH_CRITERIA,
              misspellings: false,
              where: @es_subject_query.where_queries
            )
          end
        end
      end
    end
  end
end
