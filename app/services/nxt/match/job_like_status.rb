module Nxt
  module Match
    class JobLikeStatus
      STATUS = {
        matched: :matched,
        matched_from_hunt: :matched_from_hunt,
        student_liked: :student_liked,
        none: :none
      }.freeze

      def initialize(student_profile:, job_offer:)
        @job_offer = job_offer
        @student_profile = student_profile
      end

      def get
        if match_verifier.has_match? &&
          match_verifier.did_student_like_back_a_company_hunt? &&
          match_verifier.did_student_like_the_job?(@job_offer)
          STATUS[:matched_from_hunt]
        elsif match_verifier.has_match? &&                            
          match_verifier.did_student_like_the_job?(@job_offer)
          STATUS[:matched]
        elsif match_verifier.did_student_like_the_job?(@job_offer)
          STATUS[:student_liked]
        else
          STATUS[:none]
        end
      end

      private

      def company_hunt
        @company_hunt ||= ::Hunt.find_by(
          company_profile: @job_offer.company_profile,
          student_profile: @student_profile
        )
      end

      def match_verifier
        Nxt::Match::Verifier.new(
          student_profile: @student_profile, 
          company_profile: @job_offer.company_profile
        )
      end
    end
  end
end