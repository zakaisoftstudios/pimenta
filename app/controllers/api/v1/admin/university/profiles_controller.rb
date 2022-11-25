module Api
  module V1
    module Admin
      module University
        class ProfilesController < ApiController
          before_action :authenticate_user, :authenticate_admin
          before_action :set_university, only: :destroy

          def index
            json(AdminUniversityProfilesSerializer.new(paginate(UniversityProfile.all)), 200)
          end

          def destroy
            @university.user.destroy if @university.user.present?
            @university.destroy
            json({message: "University with #{@university.id} deleted"})
          end

          private

          def set_university
            @university = UniversityProfile.find(params[:id])
          end
        end
      end
    end
  end
end
