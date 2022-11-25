require 'swagger_helper'

describe 'Job Offers API - PATCH', swagger_doc: 'v1/swagger.json' do
  path '/company/profile/job_offers/{id}' do
    patch 'Updates a job offer' do
      tags 'Job Offers'

      parameter name: :id, in: :path, type: :integer
      parameter name: :job_offer, in: :body, required: true, schema: {
        '$ref' => '#/definitions/new_job_offer'
      }

      response '200', 'job offer updated' do
        schema '$ref' => '#/definitions/job_offer'

        let('Authorization') { "Bearer #{auth[:token]}" }
        let(:id) { job_offer_id }
        let(:job_offer) { create(:new_job_offer_json) }

        run_test!
      end

      response '404', 'job offer not found' do
        let('Authorization') { "Bearer #{auth[:token]}" }
        before { job_offer_id }
        let(:job_offer) { create(:new_job_offer_json) }
        let(:id) { 0 }
        
        run_test!
      end

      response '400', 'invalid request' do
        schema '$ref' => '#/definitions/error'

        let('Authorization') { "Bearer #{auth[:token]}" }
        let(:job_offer) {}
        let(:id) { job_offer_id }

        run_test!
      end

      response '401', 'unauthorized request' do
        let('Authorization') { "Bearer invalid" }
        let(:job_offer) { create(:new_job_offer_json) }
        let(:id) { job_offer_id }

        run_test!
      end
    end
  end
end

def job_offer_id
  profile = create(:company_profile, user: auth[:user])
  create(:job_offer, company_profile_id: profile.id).id
end