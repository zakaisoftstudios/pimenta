require 'rails_helper'
Bullet.raise = false

RSpec.describe 'Subject Likes Controller', type: :request do
    let(:user) { create(:user, password: 'foobar') }
    subject_offer = nil
    company_profile = nil
    student_profile = nil
    subject_like = nil

    let(:auth) {{
      email: user.email,
      password: 'foobar'
    }}

    before(:each) {
      post '/v1/user_token',
      params: { auth: auth }.to_json,
      headers: { "Content-Type" => "application/json" }
    }

    describe 'POST /v1/subject_likes' do
      context 'with Company Profile' do
        context 'successfully if the' do
          before(:each) {
            subject_offer = create(:subject_offer)
            company_profile = create(:company_profile, user: user)
            post '/v1/subject_likes', headers: { "Authorization" => json_parse(response)['jwt'] }, params: {
              "subject_like": {
                "subject_offer_id": subject_offer.id
              }
            }
          }

          it 'current user company_profile is the same returned' do
            expect(json_parse(response)['company_profile_id']).to eq(company_profile.id)
          end

          it 'current subject_offer is the same returned' do
            expect(json_parse(response)['subject_offer_id']).to eq(subject_offer.id)
          end

          it 'student_profile_id returned is null' do
            expect(json_parse(response)['student_profile_id']).to be_nil
          end
        end
      end

      context 'with Student Profile' do
        context 'successfully if the' do
          before(:each) {
            subject_offer = create(:subject_offer)
            student_profile = create(:student_profile, user: user)
            post '/v1/subject_likes', headers: { "Authorization" => json_parse(response)['jwt'] }, params: {
              "subject_like": {
                "subject_offer_id": subject_offer.id
              }
            }
          }

          it 'current user student_profile is the same returned' do
            expect(json_parse(response)['student_profile_id']).to eq(student_profile.id)
          end

          it 'current subject_offer is the same returned' do
            expect(json_parse(response)['subject_offer_id']).to eq(subject_offer.id)
          end

          it 'company_profile_id returned is null' do
            expect(json_parse(response)['company_profile_id']).to be_nil
          end
        end
      end

      context 'unsuccessfully if the' do
        before(:each) {
          subject_offer = create(:subject_offer)
          company_profile = create(:company_profile, user: user)
          post '/v1/user_token',
          params: { auth: auth }.to_json,
          headers: { "Content-Type" => "application/json" }
        }

        it 'token is invalid' do
          post '/v1/subject_likes', headers: { "Authorization" => 'invalid' }, params: {
            "subject_like": {
              "subject_offer_id": subject_offer.id
            }
          }
          expect(response.body).to eq('')
        end

        it 'subject_like id is not valid' do
          post '/v1/subject_likes', headers: { "Authorization" => json_parse(response)['jwt'] }, params: {
            "subject_like": {
              "subject_offer_id": subject_offer.id + 1
            }
          }
          expect(response.body).to eq(' ')
        end

        it 'params are not in the rigth format' do
          post '/v1/subject_likes', headers: { "Authorization" => json_parse(response)['jwt'] }, params: {
            "subj_like": {
              "subject_offer_id": subject_offer.id + 1
            }
          }
          expect(json_parse(response)['error']).to eq('param is missing or the value is empty: subject_like')
        end
      end
    end

    describe 'DELETE /v1/subject_likes' do
      context 'successfully if the' do
        before(:each) {
          subject_offer = create(:subject_offer)
          company_profile = create(:company_profile, user: user)
          subject_like = create(:subject_like)
        }

        it 'subject_like id is valid' do
          delete "/v1/subject_likes/#{subject_like.id}", headers: { "Authorization" => json_parse(response)['jwt'] }
          expect(response.body).to eq(' ')
        end
      end
      context 'unsuccessfully if the' do
        before(:each) {
          subject_offer = create(:subject_offer)
          company_profile = create(:company_profile, user: user)
          subject_like = create(:subject_like)
        }

        it 'subject_like id is invalid' do
          delete "/v1/subject_likes/#{subject_like.id + 1}", headers: { "Authorization" => json_parse(response)['jwt'] }
          expect(response.body).to eq(' ')
        end
      end
    end

    def json_parse(response)
        JSON.parse(response.body)
    end
end
