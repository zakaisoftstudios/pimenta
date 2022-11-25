module Api
  module V1
    module Student
      class SubjectSearchController < ApiController
        before_action :authenticate_user

        def index
          json(SubjectOfferSearchResultSerializer.new(paginated_results))
        end

        private

        def results
          @results ||= Nxt::Student::Search::Subject::Search.new(
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