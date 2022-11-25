module Api
	module V1
		class LinksController < ApiController
			before_action :authenticate_user
  		before_action :set_link,      only: [:destroy, :update]

  		def index
        json(LinkSerializer.new(current_profile.links))
  		end

  		def create
        link = current_profile.links.create(link_params)

        json(LinkSerializer.new(link), :created)          			
  		end

  		def destroy
  			@link.destroy
        json({}, :no_content)
  		end

  		def update
  			@link.update(link_params)
        
        json(LinkSerializer.new(@link))               
  		end

  		private

  		def link_params
  		  params.require(:link).permit(
		      :text,
		      :url,
		      :kind
  		  )
  		end


  		private

  		def set_link
  			@link = current_profile.links.find(params[:id])
  		end

		end
	end
end			