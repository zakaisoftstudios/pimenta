require 'swagger_helper'

describe 'Interests API - GET ALL', swagger_doc: 'v1/swagger.json' do
  path '/interests' do
    get 'Gets all interests' do
      tags 'Interests'

      response '200', 'interests returned' do
        schema type: 'array', items: { '$ref' => '#/definitions/interest' }
        
        let('Authorization') { "Bearer #{auth[:token]}" }
        before { create_list(:interest, 3) }

        run_test! do
          expect(json.size).to eq 3
        end
      end

      response '401', 'unauthorized request' do
        let('Authorization') { "Bearer invalid" }

        run_test!
      end
    end
  end
end