module Api
  module V1
    module Company
      class JobOffersController < ApiController
        before_action :authenticate_user

        def index
          json(JobOfferSerializer.new(paginated_results))
        end

        def create
          json(JobOfferSerializer.new(new_job_offer), :created)
        end

        def show
          json(JobOfferSerializer.new(job_offer))
        end

        def update
          job_offer.update!(job_offer_params)
          json(JobOfferSerializer.new(job_offer))
        end

        def destroy
          job_offer.destroy
          json({}, :no_content)
        end

        private

        def job_offer_params
          params.require(:job_offer).permit(
            :category,
            :content,
            :what_is_expected_from_you,
            :what_is_expected_from_us,
            :tasks,
            :perspectives,
            :city,
            :start,
            :end_date,
            :wage,
            :free_places,
            :postal_code,
            :country,
            :latitude,
            :longitude,
            :state,
            :working_hours_per_week,
            :minimum_degree,
            :street,
            :wage_period,
            :web_site_link,
            :job_offer_skills_attributes => [
              :id, 
              :must_have, 
              :skill_id, 
              :_destroy
            ],
            :job_offer_interests_attributes => [
              :id,
              :must_have,
              :interest_id,
              :_destroy
            ],
            :job_offer_strengths_attributes => [
              :id,
              :must_have,
              :strength_id,
              :_destroy
            ],
            :attachments_attributes => [
              :id,
              :picture,
              :video,
              :purpose
            ]
          )
        end

        def new_job_offer
          @new_job_offer ||= current_user.profile.job_offers.create!(
            job_offer_params
          )
        end

        def job_offer
          @job_offer ||= current_user.profile.job_offers.includes(
            job_offer_skills:     :skill, 
            job_offer_interests:  :interest, 
            job_offer_strengths:  :strength
          ).find(params[:id])
        end

        def job_offers
          @job_offers ||= current_user.profile.job_offers.where(
            state: JobOffer.states[params[:state]])
          .includes(
            job_offer_skills:     :skill, 
            job_offer_interests:  :interest, 
            job_offer_strengths:  :strength
          )
          .order('created_at DESC')
          .page(params[:page])
        end

        def paginated_results
          Nxt::Pagination::Helper.add_total_items_count(
            items: job_offers,
            total_items_count: job_offers.total_count
          )
        end
      end
    end
  end
end