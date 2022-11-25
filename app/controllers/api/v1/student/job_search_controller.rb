module Api
  module V1
    module Student
      class JobSearchController < ApiController
        before_action :authenticate_user

        def index
          json(JobOfferSearchResultSerializer.new(paginated_results))
        end

        private

        def results
          @results ||= Nxt::Student::Search::Job::Search.new(
            student_profile: current_user.profile,
            search_params: search_params
          ).perform
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