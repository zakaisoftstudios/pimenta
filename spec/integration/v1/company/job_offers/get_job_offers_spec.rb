require 'swagger_helper'

describe 'Job Offers API - GET ALL', swagger_doc: 'v1/swagger.json' do
  path '/company/profile/job_offers' do
    get 'Gets all job offers from the current user' do
      tags 'Job Offers'

      response '200', 'job offers returned' do
        schema type: 'array', items: { '$ref' => '#/definitions/job_offer' }
        
        
        let('Authorization') { "Bearer #{auth[:token]}" }

        before do
          company_profile = create(:company_profile, user: auth[:user])
          create_list(:job_offer, 3, company_profile: company_profile) 
        end

        run_test! do
          expect(json.size).to eq 3
        end
      end
    end
  end
end