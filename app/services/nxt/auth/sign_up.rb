module Nxt
  module Auth
    class SignUp
      
      attr_reader :user_data, :profile_data, :user, :profile

      def initialize(user_data:, profile_data:)
        @user_data = user_data
        @profile_data = profile_data
      end

      def perform
        ActiveRecord::Base.transaction do
          create_profile
          create_attachments
          send_confirmation_email
        end

        profile
      end

      private

      def create_attachments
        [:avatar, :cover, :about, :video].each do |purpose|
          @profile.attachments.create(purpose: purpose)
        end  

        3.times do
          @profile.attachments.create(purpose: :regular)
        end 

        if profile_data[:avatar]
          avatar_picture = @profile.attachments.find_by(purpose: 'avatar')
          avatar_picture.update(remote_picture_url: profile_data[:avatar])
        end
      end

      def create_profile
        case profile_data[:profile_type]
        when Nxt::ProfileTypes::COMPANY
          create_profile_for(CompanyProfile)
        when Nxt::ProfileTypes::STUDENT
          create_profile_for(StudentProfile)
        when Nxt::ProfileTypes::UNIVERSITY
          create_profile_for(UniversityProfile)  
        end
      end

      def create_profile_for(profile_type)
        @profile ||= profile_type.send(
          :create!,
          user: user, 
          name: profile_data[:name]
        )
      end

      def user
        @user ||= User.create!(
          user_data.merge(confirm_token: SecureRandom.urlsafe_base64.to_s)
        )
      end

      def send_confirmation_email
        EmailConfirmationMailer.email_confirmation_email(user).deliver_later unless user.email_confirmed
      end
    end
  end
end