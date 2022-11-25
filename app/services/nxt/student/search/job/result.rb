module Nxt
  module Student
    module Search
      module Job
        class Result
          extend Forwardable
          def_delegators :@job_offer,
           :id,
           :category,
           :content,
           :what_is_expected_from_you,
           :what_is_expected_from_us,
           :tasks,
           :perspective,
           :city,
           :country,
           :postal_code,
           :start,
           :working_hours_per_week,
           :end_date,
           :wage,
           :free_places,
           :job_offer_skills,
           :job_offer_interests,
           :job_offer_strengths,
           :company_profile,
           :perspectives,
           :wage_period,
           :attachments,
           :minimum_degree,
           :web_site_link
  
          attr_accessor :total_items_count
  
          def initialize(job_offer:, student_profile:)
            @job_offer = job_offer
            @student_profile = student_profile
          end
  
          def distance
            @job_offer.distance_to(@student_profile)
          end
  
          def match_percentage
            Nxt::Student::Search::MatchingPercentage.new(
              profile: @student_profile,
              offer: @job_offer,
              offer_key: :job_offer
            ).calculate
          end

          def job_like_status
            Nxt::Match::JobLikeStatus.new(
              student_profile: @student_profile,
              job_offer: @job_offer
            ).get
          end
  
          def like
            ::Like.find_by(
              student_profile: @student_profile, 
              job_offer: @job_offer
            )
          end
        end
      end
    end
  end
end