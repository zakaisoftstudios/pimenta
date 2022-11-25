module Api
  module V1
    module NonAuthenticated
      class SubjectSearchController < ApiController
        def index
          json(SubjectOfferSearchResultNonAuthenticatedSerializer.new(paginated_results))
        end

        private


        def results
          @es_subject_query = es_subject_query
          @results ||= SubjectOffer.search(
            @es_subject_query.text_search,
            fields: Nxt::Student::Search::Subject::ESSubjectQuery::TEXT_SEARCH_FIELDS,
            match: Nxt::Student::Search::Subject::ESSubjectQuery::TEXT_SEARCH_MATCH_CRITERIA,
            misspellings: false,
            where: @es_subject_query.where_queries
          )
          Nxt::NonAuthenticated::Search::Order.new(order_by: 'created_at_dsc', results: @results).order_results
        end

        def es_subject_query
          Nxt::NonAuthenticated::Search::ESSubjectQuery.new(
            search_params: search_params
          )
        end

        def paginated_results
          Nxt::Pagination::Helper.add_total_items_count(
            items: Kaminari.paginate_array(results).page(params[:page]),
            total_items_count: results.size
          )
        end

        def search_params
          params.permit(
            :page,
            :text_search,
            :cost_amount_from,
            :cost_amount_to,
            :nummerus_clausus,
            :duration_in_hours_from,
            :duration_in_hours_to,
            :start_date,
            :distance,
            :order_by,
            :type_of_degree => [],
            :minimum_degree => []
          )
        end
      end
    end
  end
end