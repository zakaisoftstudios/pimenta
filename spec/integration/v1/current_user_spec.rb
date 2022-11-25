require 'swagger_helper'

describe 'Current User API', swagger_doc: 'v1/swagger.json' do
  path '/current_user' do
    get 'Gets the logged in user information' do
      tags 'User'

      response '200', 'user retrieved' do
        let('Authorization') { "Bearer #{auth[:token]}" }

        schema '$ref' => '#/definitions/user'
        before { |example| submit_request(example.metadata) }

        it 'returns a 200 response' do
          expect(response).to have_http_status(200)
        end

        it 'returns the user id' do
          expect(json[:id]).to eq(auth[:user].id)
        end

        it 'returns the user email' do
          expect(json[:email]).to eq(auth[:user].email)
        end
      end

      response '401', 'unauthorized request' do
        let('Authorization') { "Bearer invalid" }
        run_test!
      end
    end
  end
end