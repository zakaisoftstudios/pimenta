module Nxt
  module Student
    class Block
      def initialize(student_profile:, company_profile:)
        @student_profile = student_profile
        @company_profile = company_profile
      end

      def create
        ActiveRecord::Base.transaction do
          remove_given_likes
          reject_received_hunt
          remove_conversation
          create_block
        end
      end

      private

      def create_block
        ::Block.create!(
          student_profile: @student_profile, 
          company_profile: @company_profile
        )
      end

      def remove_given_likes
        @student_profile
          .likes
          .for_company(@company_profile)
          .destroy_all
      end

      def reject_received_hunt
        @student_profile
          .hunted_by
          .find_by(company_profile: @company_profile)
          .student_rejected!
      end

      def remove_conversation
          Nxt::Chat::Conversations.new(
            student_profile: @student_profile,
            company_profile: @company_profile
          ).destroy
        end
    end
  end
end