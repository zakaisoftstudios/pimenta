module Api
  module V1
    class InterestsController < ApiController
      before_action :authenticate_user
      
      def index
        json(InterestSerializer.new(Interest.all))
      end
    end
  end
end