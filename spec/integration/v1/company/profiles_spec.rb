require 'swagger_helper'

describe 'Company Profiles API', swagger_doc: 'v1/swagger.json' do
  path '/company/profile' do
    get 'Gets the current user profile' do
      response '200', 'profile returned' do
        schema '$ref' => '#/definitions/company_profile'
        tags 'Profiles'

        let('Authorization') { "Bearer #{auth[:token]}" }

        before { create(:company_profile_with_images, user: auth[:user]) }
        before { |example| submit_request(example.metadata) }

        it 'returns a 200 response' do |example|
          expect(response).to have_http_status(200)
        end

        it 'matches swagger spec' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns the name' do |example|
          expect(json[:name]).to eq attributes_for(:company_profile)[:name]
        end

        it 'returns the contact person' do |example|
          expect(json[:contact_person]).to eq(
            attributes_for(:company_profile)[:contact_person]
          )
        end

        it 'returns the industry sector' do |example|
          expect(json[:industry_sector]).to eq(
            attributes_for(:company_profile)[:industry_sector]
          )
        end

        it 'returns the number of employees' do |example|
          expect(json[:number_of_employees]).to eq(
            attributes_for(:company_profile)[:number_of_employees]
          )
        end

        it 'returns the country' do |example|
          expect(json[:country]).to eq(
            attributes_for(:company_profile)[:country]
          )
        end

        it 'returns the city' do |example|
          expect(json[:city]).to eq(
            attributes_for(:company_profile)[:city]
          )
        end

        it 'returns the street' do |example|
          expect(json[:street]).to eq(
            attributes_for(:company_profile)[:street]
          )
        end

        it 'returns the What we do' do |example|
          expect(json[:what_we_do]).to eq(
            attributes_for(:company_profile)[:what_we_do]
          )
        end

        it 'returns the Why we do it' do |example|
          expect(json[:why_we_do_it]).to eq(
            attributes_for(:company_profile)[:why_we_do_it]
          )
        end

        it 'returns the Why should you join our team' do |example|
          expect(json[:why_you_should_join_our_team]).to eq(
            attributes_for(
              :company_profile
            )[:why_you_should_join_our_team]
          )
        end

        it 'returns the Special features' do |example|
          expect(json[:special_features]).to eq(
            attributes_for(:company_profile)[:special_features]
          )
        end

        it 'returns the Home Page' do |example|
          expect(json[:home_page]).to eq(
            attributes_for(:company_profile)[:home_page]
          )
        end

        it 'returns the Youtube Link' do |example|
          expect(json[:youtube_link]).to eq(
            attributes_for(:company_profile)[:youtube_link]
          )
        end

        it 'returns the Facebook Link' do |example|
          expect(json[:facebok_link]).to eq(
            attributes_for(:company_profile)[:facebok_link]
          )
        end

        it 'returns the Twitter Link' do |example|
          expect(json[:twitter_link]).to eq(
            attributes_for(:company_profile)[:twitter_link]
          )
        end

        response '401', 'unauthorized request' do
          let('Authorization') { "Bearer invalid" }
          let(:profile) {}
  
          run_test!
        end
      end
    end

    patch 'Updates the current user profile' do
      tags 'Profiles'

      parameter name: :profile, in: :body, required: true, schema: {
        '$ref' => '#/definitions/new_company_profile'
      }

      response '200', 'profile updated' do
        schema '$ref' => '#/definitions/company_profile'

        let('Authorization') { "Bearer #{auth[:token]}" }

        before { create(:company_profile_with_images, user: auth[:user]) }
        before { |example| submit_request(example.metadata) }

        let(:profile) {{ profile: attributes_for(:updated_company_profile) }}

        it 'returns a 200 response' do |example|
          expect(response).to have_http_status(200)
        end

        it 'matches swagger spec' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'updates the name' do |example|
          expect(json[:name]).to eq(
            attributes_for(:updated_company_profile)[:name]
          )
        end

        it 'updates the contact person' do |example|
          expect(json[:contact_person]).to eq(
            attributes_for(:updated_company_profile)[:contact_person]
          )
        end

        it 'updates the industry sector' do |example|
          expect(json[:industry_sector]).to eq(
            attributes_for(:updated_company_profile)[:industry_sector]
          )
        end

        it 'updates the number of employees' do |example|
          expect(json[:number_of_employees]).to eq(
            attributes_for(:updated_company_profile)[:number_of_employees]
          )
        end

        it 'updates the country' do |example|
          expect(json[:country]).to eq(
            attributes_for(:updated_company_profile)[:country]
          )
        end

        it 'updates the city' do |example|
          expect(json[:city]).to eq(
            attributes_for(:updated_company_profile)[:city]
          )
        end

        it 'updates the street' do |example|
          expect(json[:street]).to eq(
            attributes_for(:updated_company_profile)[:street]
          )
        end

        it 'updates the What we do' do |example|
          expect(json[:what_we_do]).to eq(
            attributes_for(:updated_company_profile)[:what_we_do]
          )
        end

        it 'updates the Why we do it' do |example|
          expect(json[:why_we_do_it]).to eq(
            attributes_for(:updated_company_profile)[:why_we_do_it]
          )
        end

        it 'updates the Why should you join our team' do |example|
          expect(json[:why_you_should_join_our_team]).to eq(
            attributes_for(
              :updated_company_profile
            )[:why_you_should_join_our_team]
          )
        end

        it 'updates the Special features' do |example|
          expect(json[:special_features]).to eq(
            attributes_for(:updated_company_profile)[:special_features]
          )
        end

        it 'updates the Home Page' do |example|
          expect(json[:home_page]).to eq(
            attributes_for(:updated_company_profile)[:home_page]
          )
        end

        it 'updates the Youtube Link' do |example|
          expect(json[:youtube_link]).to eq(
            attributes_for(:updated_company_profile)[:youtube_link]
          )
        end

        it 'updates the Facebook Link' do |example|
          expect(json[:facebok_link]).to eq(
            attributes_for(:updated_company_profile)[:facebok_link]
          )
        end

        it 'updates the Twitter Link' do |example|
          expect(json[:twitter_link]).to eq(
            attributes_for(:updated_company_profile)[:twitter_link]
          )
        end
      end

      response '401', 'unauthorized request' do
        let('Authorization') { "Bearer invalid" }
        let(:profile) {}

        run_test!
      end

      response '400', 'invalid request' do
        schema '$ref' => '#/definitions/error'
        
        let('Authorization') { "Bearer #{auth[:token]}" }

        # context 'when the name is empty' do
        #   let(:profile) {{ profile: 
        #     attributes_for(:company_profile, name: '') 
        #   }}

        #   run_test!
        # end
      end
    end
  end 
end