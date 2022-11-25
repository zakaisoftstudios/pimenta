module Nxt
  module Company
    module Hunt
      class CreateHuntService
        def initialize(company_profile:, student_profile:)
          @company_profile = company_profile
          @student_profile = student_profile
        end
  
        def call
          ActiveRecord::Base.transaction do
            unless match_verifier.has_match?
              hunt = create_hunt
              conversations.create
              send_email

              OpenStruct.new(hunt: hunt)
            end
          end
        end
  
        private
  
        def create_hunt
          @company_profile.hunts.create!(
            student_profile: @student_profile
          )
        end

        def conversations
          Nxt::Chat::Conversations.new(
            student_profile: @student_profile,
            company_profile: @company_profile
          )
        end

        def match_verifier
          Nxt::Match::Verifier.new(
            student_profile: @student_profile, 
            company_profile: @company_profile
          )
        end

        def send_email
          MatchMailer.new_hunt(
            recipient: @student_profile.user,
            hunter: @company_profile.user
          ).deliver_later
        end
      end
    end
  end
end