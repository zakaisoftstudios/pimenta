require 'swagger_helper'

describe 'Attachments API', swagger_doc: 'v1/swagger.json' do
  path '/attachments' do
  	get 'Gets the current user profile' do
      response '200', 'profile returned' do
        schema '$ref' => '#/definitions/attachment'
        tags 'Attachments'
      end
    end    
  end
end  	
