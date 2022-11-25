module Nxt
  module Match
    class Verifier
      def initialize(student_profile:, company_profile:)
        @student_profile = student_profile
        @company_profile = company_profile
      end

      def has_match?
        (
          did_student_like_a_job? && 
          did_company_hunt_student?
        ) || 
        did_company_like_back_a_student_job_like? ||
        did_student_like_back_a_company_hunt?
      end

      def did_student_like_a_job?
        student_job_likes.any?
      end

      def did_student_like_the_job?(job_offer)
        job_offer.likes.exists?(student_profile: @student_profile)
      end

      def did_company_hunt_student?
        company_hunt.present?
      end

      def did_student_like_back_a_company_hunt?
        did_company_hunt_student? && company_hunt.student_liked_back?
      end

      private

      def did_company_like_back_a_student_job_like?
        student_job_likes.company_liked_back.any?
      end

      def student_job_likes
        @student_job_likes ||= ::Like
          .for_company(@company_profile)
          .received_from(@student_profile)
      end

      def company_hunt
        @company_hunt ||= ::Hunt.find_by(
          company_profile: @company_profile,
          student_profile: @student_profile
        )
      end
    end
  end
end