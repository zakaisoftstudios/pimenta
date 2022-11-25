require 'swagger_helper'

describe 'Job Offers API - POST', swagger_doc: 'v1/swagger.json' do
  path '/company/profile/job_offers' do
    post 'Creates a new job offer' do
      tags 'Job Offers'

      parameter name: :job_offer, in: :body, required: true, schema: {
        '$ref' => '#/definitions/new_job_offer'
      }

      response '201', 'job offer created' do
        schema '$ref' => '#/definitions/job_offer'

        let('Authorization') { "Bearer #{auth[:token]}" }

        let(:job_offer) {
          profile = create(:company_profile, user: auth[:user])

          { 
            job_offer: create(
              :new_job_offer_json, 
              company_profile_id: profile.id
            ) 
          }
        }

        run_test! do
          expect(json).to eq(create(:created_job_offer_json))
        end
      end

      response '400', 'invalid request' do
        schema '$ref' => '#/definitions/error'
        let('Authorization') { "Bearer #{auth[:token]}" }
        
        context 'when the job offer is invalid' do
          let(:job_offer) {}
          run_test!
        end
      end

      response '401', 'unauthorized request' do
        let('Authorization') { "Bearer invalid" }
        let(:job_offer) {}

        run_test!
      end
    end
  end
end