module Api
  module V1
    class StrengthsController < ApiController
      before_action :authenticate_user
      
      def index
        json(StrengthSerializer.new(Strength.all))
      end
    end
  end
end