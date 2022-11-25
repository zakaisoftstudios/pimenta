module Api
  module V1
    class SkillsController < ApiController
      before_action :authenticate_user

      def index
        json(SkillSerializer.new(Skill.all))
      end
    end
  end
end