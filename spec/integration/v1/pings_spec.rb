require 'swagger_helper'

describe 'Pings API', swagger_doc: 'v1/swagger.json' do
  path '/pings' do
    get 'Checks if API is on' do
      tags 'Ping'
      security []
      
      response '200', 'API is on' do
        run_test!
      end  

      response '404', 'API is offfline' do
      end
    end
  end
end