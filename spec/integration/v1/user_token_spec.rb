require 'swagger_helper'

describe 'User Token API', swagger_doc: 'v1/swagger.json' do
  path '/user_token' do
    post 'Requests an access token for the given user' do
      tags 'Auth'
      security []
      
      parameter name: :auth, in: :body, required: true, schema: {
        '$ref' => '#/definitions/auth'
      }

      response '201', 'successful authentication' do
        schema '$ref' => '#/definitions/jwt'

        let(:user) { create(:user, email: 'authfoo@bar.com', password: 'foobar') }
        let(:auth) { { auth: { email: user.email, password: user.password }} }

        run_test!
      end

      response '400', 'invalid credentials' do
        let(:auth) {{ auth: { email: 'invalid', password: 'invalid' }}}
        run_test!
      end
    end
  end
end