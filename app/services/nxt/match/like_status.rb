module Nxt
  module Match
    class LikeStatus
      STATUS = {
        matched: :matched,
        matched_from_hunt: :matched_from_hunt,
        student_liked: :student_liked,
        none: :none
      }.freeze

      def initialize(company_profile:, student_profile:)
        @company_profile = company_profile
        @student_profile = student_profile
      end

      def get
        if match_verifier.has_match? &&
          match_verifier.did_student_like_back_a_company_hunt?
          STATUS[:matched_from_hunt]
        elsif match_verifier.has_match?
          STATUS[:matched]
        elsif match_verifier.did_student_like_a_job?
          STATUS[:student_liked]
        else
          STATUS[:none]
        end
      end

      private

      def match_verifier
        Nxt::Match::Verifier.new(
          student_profile: @student_profile, 
          company_profile: @company_profile
        )
      end
    end
  end
end