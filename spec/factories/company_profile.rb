FactoryBot.define do
  base64_image = File.read(Rails.root.join(
    'spec/fixtures/images/base64_image.txt')
  )

  factory :company_profile do
    name 'Foo Company'
    contact_person 'Foo Bar Person'
    industry_sector 'Foo Sector'
    number_of_employees 5
    country 'Brazil'
    city 'Cuiaba'
    street 'Foo bar street'
    what_we_do 'What we do'
    why_we_do_it 'Why we do it'
    why_you_should_join_our_team 'Why should you join our team'
    special_features 'Special features'
    latitude  52.5227915
    longitude 13.3914374
    user { create(:user) }
    
    # after :create do |b|
    #   b.update_column(:picture, '/foo/bar/baz.png')
    # end

    factory :company_profile_with_images do
      transient do
        images_count 2
      end

      # after(:create) do |company_profile, evaluator|
      #   create_list(
      #     company_profile: company_profile
      #   )
      # end
    end
  end

  factory :updated_company_profile, class: CompanyProfile do
    name 'Foo Company Updated'
    contact_person 'Foo Bar Person Updated'
    industry_sector 'Foo Sector Updated'
    number_of_employees 6
    country 'Brazil Updated'
    city 'Cuiaba Updated'
    street 'Foo bar street Updated'
    what_we_do 'What we do Updated'
    why_we_do_it 'Why we do it Updated'
    why_you_should_join_our_team 'Why should you join our team Updated'
    special_features 'Special features Updated'
    latitude  52.5227915
    longitude 13.3914374
  end
end