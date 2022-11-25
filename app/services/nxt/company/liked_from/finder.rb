module Nxt
  module Company
    module LikedFrom
      class Finder
        attr_reader :company_profile

        def initialize(company_profile:)
          @company_profile = company_profile
        end

        def student_likes
          ::Like
            .for_company(company_profile)
            .group_by(&:student_profile)
            .reduce([]) do |liked_from, (student_profile, likes)|
              liked_from << new_result(student_profile, likes)
            end
        end

        private

        def new_result(student_profile, likes)
          Nxt::Company::LikedFrom::Result.new(
            student_profile: student_profile,
            student_likes: likes,
            company_profile: company_profile
          )
        end
      end
    end
  end
end