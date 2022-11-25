require 'swagger_helper'

describe 'Skills API - GET ALL', swagger_doc: 'v1/swagger.json' do
  path '/skills' do
    get 'Gets all skills' do
      tags 'Skills'

      response '200', 'skills returned' do
        schema type: 'array', items: { '$ref' => '#/definitions/skill' }
        
        let('Authorization') { "Bearer #{auth[:token]}" }
        before { create_list(:skill, 3) }

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