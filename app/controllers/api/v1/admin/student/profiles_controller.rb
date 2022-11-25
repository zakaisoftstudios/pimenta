module Api
  module V1
    module Admin
      module Student
        class ProfilesController < ApiController
          before_action :authenticate_user, :authenticate_admin
          before_action :set_student, only: :destroy

          def index
            json(AdminStudentProfilesSerializer.new(paginate(StudentProfile.all)), 200)
          end

          def destroy
            @student.user.destroy if @student.user.present?
            @student.destroy
            json({message: "Student with #{@student.id} deleted"})
          end

          private

          def set_student
            @student = StudentProfile.find(params[:id])
          end
        end
      end
    end
  end
end
