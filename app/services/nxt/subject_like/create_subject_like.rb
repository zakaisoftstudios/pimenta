module Nxt
  module SubjectLike
    class CreateSubjectLike
      def initialize(subject_offer:, profile:)
        @subject_offer = subject_offer
        @profile = profile
      end

      def call
        @profile.subject_likes.create!(
          subject_offer: @subject_offer
        )
      end
    end
  end
end
