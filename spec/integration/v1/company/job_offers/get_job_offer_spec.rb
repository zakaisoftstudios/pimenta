require 'swagger_helper'

describe 'Job Offers API - GET', swagger_doc: 'v1/swagger.json' do
  path '/company/profile/job_offers/{id}' do
    get 'Gets a job offer' do
      tags 'Job Offers'
      parameter name: :id, in: :path, type: :integer

      response '200', 'job offer returned' do
        schema '$ref' => '#/definitions/job_offer'
        
        let('Authorization') { "Bearer #{auth[:token]}" }
        let(:id) { job_offer_id }

        run_test! do
          expect(json).to eq(create(:created_job_offer_json))
        end

        response '404', 'job offer not found' do
          before { job_offer_id }
          let('Authorization') { "Bearer #{auth[:token]}" }
          let(:id) { 0 }
          
          run_test!
        end
  
        response '401', 'unauthorized request' do
          let('Authorization') { "Bearer invalid" }
          let(:id) {}
  
          run_test!
        end
      end
    end
  end
end

def job_offer_id
  profile = create(:company_profile, user: auth[:user])
  create(:job_offer, company_profile_id: profile.id).id
end