module Api
  module V1
    module Admin
      class DashboardController < ApiController
        before_action :authenticate_user, :authenticate_admin

        def index
          json(AdminDashboardSerializer.new(Nxt::Admin::Dashboard.new))
        end
      end
    end
  end
end
