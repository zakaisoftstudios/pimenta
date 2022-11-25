module Nxt
  module Company
    module Block
      class Creator
        attr_reader :student_profile, :company_profile

        def initialize(company_profile:, student_profile_id:)
          @company_profile = company_profile
          @student_profile = StudentProfile.find(student_profile_id)
        end

        def create
          ActiveRecord::Base.transaction do
            remove_received_likes
            remove_hunts
            create_block
          end
        end

        private

        def create_block
          ::Block.create!(
            student_profile: student_profile, 
            company_profile: company_profile
          )
        end

        def remove_received_likes
          ::Like
            .for_company(company_profile)
            .received_from(student_profile)
            .destroy_all
        end

        def remove_hunts
          company_profile
            .hunts
            .where(student_profile: student_profile)
            .destroy_all
        end
      end
    end
  end
end