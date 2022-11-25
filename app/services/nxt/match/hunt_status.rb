module Nxt
  module Match
    class HuntStatus
      STATUS = {
        hunted: :hunted,
        matched: :matched,
        rejected: :rejected,
        none: :none
      }.freeze

      def initialize(company_profile:, student_profile:)
        @company_profile = company_profile
        @student_profile = student_profile
      end

      def get
        if match_verifier.has_match?
          STATUS[:matched]
        elsif match_verifier.did_company_hunt_student?
          STATUS[:hunted]
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