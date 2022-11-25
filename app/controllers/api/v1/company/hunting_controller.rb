module Api
  module V1
    module Company
      class HuntingController < ApiController
        before_action :authenticate_user

        def index
          json(StudentProfileSearchResultSerializer.new(paginated_results))
        end
  
        private

        def paginated_results
          Nxt::Pagination::Helper.add_total_items_count(
            items: Kaminari.paginate_array(results).page(params[:page]),
            total_items_count: results.size
          )  
        end
  
        def results
          @results ||= Nxt::Company::Hunting::StudentSearch.new(
            company_profile: current_user.profile,
            search_params: search_params
          ).perform
        end

        def search_params
          params.permit(
            :text_search, 
            :age_from, 
            :age_to, 
            :page, 
            :grade_point_average,
            :distance,
            :gender => [],
            :mobility => [],
            :educational_level => [],
            :skill_ids => [],
            :interest_ids => [],
            :strength_ids => []
          )
        end
      end
    end
  end
end