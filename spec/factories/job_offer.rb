FactoryBot.define do
  factory :job_offer do
    category :job
    content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    what_is_expected_from_you 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    what_is_expected_from_us 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    tasks 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    perspectives 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    city 'Cuiaba' 
    start "July 2, #{DateTime.now.year + 1}"
    end_date "July 2, #{DateTime.now.year + 2}"
    wage 10.99
    free_places 2
    company_profile_id nil
    postal_code '101555'
    latitude 101212111
    longitude 102121212
    country 'Germany'
    minimum_degree 'bachelor'
    street 'Carapinima'
    job_offer_skills {[
      JobOfferSkill.new(skill: create(:skill), must_have: true),
      JobOfferSkill.new(skill: create(:skill))
    ]}
    job_offer_interests {[
      JobOfferInterest.new(interest: create(:interest), must_have: true),
      JobOfferInterest.new(interest: create(:interest))
    ]}
    job_offer_strengths {[
      JobOfferStrength.new(strength: create(:strength), must_have: true),
      JobOfferStrength.new(strength: create(:strength))
    ]}

    after :create do |job_offer|
      job_offer.skills << create_list(:skill, 3)
      job_offer.interests << create_list(:interest, 3)
      job_offer.strengths << create_list(:strength, 3)
    end
  end

  factory :new_job_offer_json, class: Hash do
    skip_create

    category 'job'
    content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    what_is_expected_from_you   'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    what_is_expected_from_us 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    tasks 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    perspectives 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    city 'Cuiaba' 
    start "July 2, #{DateTime.now.year + 1}"
    end_date "July 2, #{DateTime.now.year + 2}"
    wage 10.99
    free_places 2
    company_profile_id nil
    skill_ids { create_list(:skill, 3).map { |skill| skill.id }}
    postal_code '101555'
    latitude 101212111
    longitude 102121212
    country 'Germany'
    
    interest_ids do 
      create_list(:interest, 3).map { |interest| interest.id }
    end
    
    strength_ids do
      create_list(:strength, 3).map { |strength| strength.id }
    end

    initialize_with { attributes.stringify_keys }
  end

  factory :invalid_job_offer_json, class: Hash do
    skip_create
    initialize_with { attributes.stringify_keys }
  end

  factory :created_job_offer_json, class: Hash do
    skip_create

    category 'job'
    content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    what_is_expected_from_you   'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    what_is_expected_from_us 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    tasks 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    perspectives 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
    city 'Cuiaba' 
    start "July 2, #{DateTime.now.year + 1}"
    end_date "July 2, #{DateTime.now.year + 2}"
    wage 10.99
    free_places 2
    id { JobOffer.last.id }
    company_profile_id { CompanyProfile.last.id }
    postal_code '101555'
    latitude 101212111
    longitude 102121212
    country 'Germany'
    
    skills do
      Skill.all.map do |skill| 
        JSON.parse(SkillSerializer.new(skill).to_json)
      end 
    end

    interests do
      Interest.all.map do |interest| 
        JSON.parse(InterestSerializer.new(interest).to_json)
      end
    end

    strengths do
      Strength.all.map do |strength| 
        JSON.parse(StrengthSerializer.new(strength).to_json)
      end
    end

    initialize_with { attributes.stringify_keys }
  end
end