require 'swagger_helper'

describe 'Strengths API - GET ALL', swagger_doc: 'v1/swagger.json' do
  path '/strengths' do
    get 'Gets all strengths' do
      tags 'Strengths'

      response '200', 'strengths returned' do
        schema type: 'array', items: { '$ref' => '#/definitions/strength' }
        
        let('Authorization') { "Bearer #{auth[:token]}" }
        before { create_list(:strength, 3) }

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