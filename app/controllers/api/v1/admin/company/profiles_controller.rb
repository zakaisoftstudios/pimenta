module Api
  module V1
    module Admin
      module Company
        class ProfilesController < ApiController
          before_action :authenticate_user, :authenticate_admin
          before_action :set_company, only: :destroy

          def index
            json(AdminCompanyProfilesSerializer.new(paginate(CompanyProfile.all)), 200)
          end

          def destroy
            @company.user.destroy if @company.user.present?
            @company.destroy
            json({message: "Company with id #{@company.id} deleted"})
          end

          private

          def set_company
            @company = CompanyProfile.find(params[:id])
          end
        end
      end
    end
  end
end
