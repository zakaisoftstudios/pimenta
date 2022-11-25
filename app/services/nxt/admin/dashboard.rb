module Nxt
  module Admin
    class Dashboard
      attr_reader :companies_quantity,
                  :job_offers_quantity,
                  :students_quantity,
                  :subject_offers_quantity,
                  :universities_quantity,
                  :admins_quantity,
                  :admins_percentage,
                  :users_quantity

      def initialize
        @companies_quantity = Float(CompanyProfile.all.size)
        @job_offers_quantity = Float(JobOffer.all.size)
        @students_quantity = Float(StudentProfile.all.size)
        @subject_offers_quantity = Float(::SubjectOffer.all.size)
        @universities_quantity = Float(UniversityProfile.all.size)
        @admins_quantity = Float(AdminProfile.all.size)
        @users_quantity = Float(User.all.size)
      end

      def companies_percentage
        percentage(@companies_quantity / @users_quantity)
      end

      def students_percentage
        percentage(@students_quantity / @users_quantity)
      end

      def universities_percentage
        percentage(@universities_quantity / @users_quantity)
      end

      def admins_percentage
        percentage(@admins_quantity / @users_quantity)
      end

      private

      def percentage number
        round_down(number * 100)
      end

      def round_down number
        '%.2f' % number
      end
    end
  end
end
