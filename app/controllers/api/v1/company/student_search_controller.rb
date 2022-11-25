module Api::V1
	class Company::StudentSearchController < ApiController
		before_action :authenticate_user

		def index
			results = StudentProfile.search(params[:keywords], operator: :or)
			json(StudentProfileSerializer.new(results))
		end
	end
end
