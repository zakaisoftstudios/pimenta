FactoryBot.define do
  factory :strength do
    sequence(:label) { |n| "Strength #{n}" }
    sequence(:value) { |n|  "strength_#{n.to_s}" }
  end
end