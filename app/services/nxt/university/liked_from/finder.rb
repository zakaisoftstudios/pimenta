module Nxt
  module University
    module LikedFrom 
      class Finder
        def initialize(university_profile:)
          @university_profile = university_profile 
        end

        def call
          @university_profile
            .subject_likes
            .group_by(&:student_profile)
            .reduce([]) do |liked_from, (student_profile, likes)|
              liked_from << new_result(student_profile, likes)
            end
        end

        private

        def new_result(student_profile, likes)
          Result.new(
            student_profile: student_profile,
            student_likes: likes,
            university_profile: @university_profile 
          )
        end
      end
    end     
  end
end