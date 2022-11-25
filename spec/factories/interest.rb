FactoryBot.define do
  factory :interest do
    sequence(:label) { |n| "Interest #{n}" }
    sequence(:value) { |n|  "interest_#{n.to_s}" }
  end
end