require 'swagger_helper'

describe 'Company Account API - DELETE - /v1/account', swagger_doc: 'v1/swagger.json' do
  let(:headers) { { authorization: "Bearer #{auth[:token]}" } }

  context 'request to destroy the current Company User and all those associations' do
    before (:each) do
      profile = create(:company_profile, user: auth[:user])
      job_offer = create(:job_offer, company_profile_id: profile.id)
    end

    it 'if the user has a Company Profile, return 200' do
      delete '/v1/account', headers: headers
      expect(parse(response.body)).to eq({'message' => 'CompanyProfile deleted'})
    end
  end

  context 'request to destroy the current Student User and all those associations' do
    before (:each) do 
      create(:student_profile, user: auth[:user])
    end

    it 'if the user has a Student Profile, return 200' do
      delete '/v1/account', headers: headers
      expect(parse(response.body)).to eq({'message' => 'StudentProfile deleted'})
    end
  end

  context 'request to destroy the current University User and all those associations' do
    before (:each) do 
      create(:university_profile, user: auth[:user])
    end

    it 'if the user has a University Profile, return 200' do
      delete '/v1/account', headers: headers
      expect(parse(response.body)).to eq({'message' => 'UniversityProfile deleted'})
    end
  end
end

def parse(data)
  JSON.parse(data)
end
