module Api
  module V1
    module Company
      class HuntsController < ApiController
        before_action :authenticate_user
        before_action :set_create_hunt_service, only: :create
        before_action :set_destroy_hunt_service, only: :destroy

        def index
          hunts = current_user.profile.hunts
          json(HuntSerializer.new(hunts))
        end

        def create
          result = @create_hunt_service.call
          json = HuntBlueprint.render(result.hunt)

          render(json: json, status: :created)
        end

        def destroy
          @destroy_hunt_service.call
          json({}, :no_content)
        end
  
        private

        def hunt_params
          params.require(:hunt).permit(:student_profile_id)
        end

        def set_create_hunt_service
          student_profile = StudentProfile.find(
            hunt_params[:student_profile_id]
          )

          @create_hunt_service ||= Nxt::Company::Hunt::CreateHuntService.new(
            company_profile: current_user.profile,
            student_profile: student_profile
          )
        end

        def set_destroy_hunt_service
          hunt = current_user.profile.hunts.find(params[:id])

          @destroy_hunt_service ||= Nxt::Company::Hunt::DestroyHuntService.new(
            hunt: hunt
          )
        end
      end
    end
  end
end