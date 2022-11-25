module Api
  module V1
    module Student
      class HuntedByController < ApiController
        before_action :authenticate_user

        def index
          hunts = current_user.profile.hunted_by.where.not(
            state: :student_rejected
          )

          json(HuntedBySerializer.new(hunts))
        end
      end
    end
  end
end