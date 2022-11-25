FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foobar#{n}@email.com" }
    password 'foobar'
    confirm_token 'foobar'
    email_confirmed true
  end
end