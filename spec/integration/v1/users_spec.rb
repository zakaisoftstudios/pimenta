require 'swagger_helper'

describe 'Users API', swagger_doc: 'v1/swagger.json' do
  path '/users' do
    post 'Creates a new user' do
      tags 'User'
      security []

      parameter name: :user, in: :body, required: true, schema: {
        '$ref' => '#/definitions/new_user'
      }

      response '201', 'user created' do
        schema '$ref' => '#/definitions/user'
        before { |example| submit_request(example.metadata) }
        
        let(:user) {{ user: {
          name: 'Foo Bar',
          email: 'foobar@email.com', 
          password: 'foobar', 
          password_confirmation: 'foobar', 
          profile_type: 'CompanyProfile'
        }}}
          
        it 'returns a 201 response' do |example|
          expect(response.status).to be(201)
        end

        it 'returns the created user email' do
          expect(json[:email]).to eq('foobar@email.com')
        end

        it 'returns the user profile name' do
          expect(json[:profile][:name]).to eq('Foo Bar')
        end

        it 'returns the user profile type' do
          expect(json[:profile_type]).to eq('CompanyProfile')
        end

        it 'returns the user jwt token' do
          # expect(json[:jwt]).to be_present
        end
      end

      response '400', 'invalid request' do
        schema '$ref' => '#/definitions/error'
        
        context 'when the name is empty' do
          let(:user) {{ user: {
            name: '',
            email: 'foobar@email.com', 
            password: 'foobar', 
            password_confirmation: 'foobar',
            profile_type: 'CompanyProfile'
          }}}

          run_test!
        end

        context 'when the email is empty' do
          let(:user) {{ user: {
            name: 'Foo Bar',
            email: '', 
            password: 'foobar', 
            password_confirmation: 'foobar',
            profile_type: 'CompanyProfile'
          }}}

          run_test!
        end

        context 'when the email format is invalid' do
          let(:user) {{ user: { 
            name: 'Foo Bar',
            email: 'foobar', 
            password: 'foobar', 
            password_confirmation: 'foobar',
            profile_type: 'CompanyProfile'
          }}}

          run_test!
        end

        context 'when the email has already been taken' do
          before { create(:user, email: 'existing@email.com') }
          
          let(:user) {{ user: { 
            name: 'Foo Bar',
            email: 'existing@email.com', 
            password: 'foobar', 
            password_confirmation: 'foobar',
            profile_type: 'CompanyProfile'
          }}}

          run_test!
        end

        context 'when the password has less than 6 characters' do
          let(:user) {{ user: { 
            name: 'Foo Bar',
            email: 'foobar@email.com', 
            password: 'foo', 
            password_confirmation: 'foo',
            profile_type: 'CompanyProfile' 
          }}}

          run_test!
        end

        context 'when the password confirmation does not match' do
          let(:user) {{ user: { 
            name: 'Foo Bar',
            email: 'foobar@email.com', 
            password: 'foobar', 
            password_confirmation: 'invalid',
            profile_type: 'CompanyProfile'
          }}}

          run_test!
        end
      end
    end
  end
end