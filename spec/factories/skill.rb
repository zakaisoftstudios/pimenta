FactoryBot.define do
  factory :skill do
    sequence(:label) { |n| "Skill #{n}" }
    sequence(:value) { |n|  "skill_#{n.to_s}" }
  end
end