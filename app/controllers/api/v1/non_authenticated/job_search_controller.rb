module Api
  module V1
    module NonAuthenticated
      class JobSearchController < ApiController
        def index
          json(JobOfferSearchResultNonAuthenticatedSerializer.new(paginated_results))
        end

        private

        def results
          @es_job_query = es_job_query
          @results ||= JobOffer.search(
            @es_job_query.text_search,
            fields: Nxt::Student::Search::Job::ESJobQuery::TEXT_SEARCH_FIELDS,
            match: Nxt::Student::Search::Job::ESJobQuery::TEXT_SEARCH_MATCH_CRITERIA,
            misspellings: false,
            where: @es_job_query.where_queries,
            order: 'start'
          )
          Nxt::NonAuthenticated::Search::Order.new(order_by: 'created_at_dsc', results: @results).order_results
        end

        def es_job_query
          Nxt::NonAuthenticated::Search::ESJobQuery.new(
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
            :wage,
            :start,
            :text_search,
            :distance,
            :order_by,
            :working_hours_per_week_from,
            :working_hours_per_week_to,
            :category => [],
            :minimum_degree => []
          )
        end
      end
    end
  end
end