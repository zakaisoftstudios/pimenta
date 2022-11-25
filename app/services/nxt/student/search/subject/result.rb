module Nxt
  module Student
    module Search
      module Subject
        class Result
          extend Forwardable
          def_delegators :@subject_offer,
            :id,
            :state,
            :name,
            :type_of_degree,
            :content,
            :perspectives,
            :tests,
            :postal_code,
            :country,
            :city,
            :street,
            :latitude,
            :longitude,
            :start_date,
            :start_dates,
            :duration_in_hours,
            :cost_period,
            :cost_amount,
            :hours_of_classes_per_week,
  	        :number_of_places,
            :nummerus_clausus,
            :minimum_degree,
            :subject_offer_skills,
            :subject_offer_interests,
            :subject_offer_strengths,
            :university_profile,
            :attachments,
            :web_site_link
  
          attr_accessor :total_items_count
  
          def initialize(subject_offer:, student_profile:)
            @subject_offer = subject_offer
            @student_profile = student_profile
          end
  
          def distance
            @subject_offer.distance_to(@student_profile)
          end
  
          def match_percentage
            Nxt::Student::Search::MatchingPercentage.new(
              profile: @student_profile,
              offer: @subject_offer,
              offer_key: :subject_offer
            ).calculate
          end
  
          def like
            ::SubjectLike.find_by(
             student_profile: @student_profile,
             subject_offer: @subject_offer 
            )
          end
        end
      end
    end
  end
end