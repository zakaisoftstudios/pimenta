module Api
  module V1
    module University
      class SubjectOffersController < ApiController
      	before_action :authenticate_user

				def index
					subject_offers = current_profile
						.subject_offers
						.where(
							state: SubjectOffer.states[params[:state]]
						)
						.order('created_at DESC')
          	.page(params[:page])

					paginated_results = Nxt::Pagination::Helper.add_total_items_count(
            items: subject_offers,
            total_items_count: subject_offers.total_count
          )

      		json(SubjectOfferSerializer.new(paginated_results))
      	end

        def create
      		new_subject_offer = current_profile.subject_offers.create!(
						subject_offer_params
					)

      		json(SubjectOfferSerializer.new(new_subject_offer), :created)
				end
				
				def show
					json(SubjectOfferSerializer.new(subject_offer))
				end

      	def update
					subject_offer.update!(subject_offer_params)
      		json(SubjectOfferSerializer.new(subject_offer))
      	end

				def destroy
          subject_offer.destroy
          json({}, :no_content)
				end
				
      	private

      		def current_profile
      			current_user.profile
					end
					
					def subject_offer
						@subject_offer ||= current_profile.subject_offers.find(params[:id])
					end

      		def subject_offer_params
      			params.require(:subject_offer).permit(
							:name,
							:state,
							:type_of_degree,
							:content,
							:perspectives,
							:tests,
							:postal_code,
							:country,
							:city,
							:street,
							:latitude,
							:longitude,
							:start_date,
							:duration_in_hours,
							:cost_period,
							:cost_amount,
							:hours_of_classes_per_week,
  						:number_of_places,
							:nummerus_clausus,
							:minimum_degree,
							:web_site_link,
							:attachments_attributes => [
								:id,
								:picture,
								:video,
								:purpose
							],
							:subject_offer_skills_attributes => [
								:id,
								:must_have,
								:skill_id,
								:_destroy
							],
							:subject_offer_interests_attributes => [
								:id,
								:must_have,
								:interest_id,
								:_destroy
							],
							:subject_offer_strengths_attributes => [
								:id,
								:must_have,
								:strength_id,
								:_destroy
							],
							:start_dates => []
						)
      		end
      end
    end
  end
end  
