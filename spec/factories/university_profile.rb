FactoryBot.define do
  base64_image = File.read(Rails.root.join(
    'spec/fixtures/images/base64_image.txt')
  )

  factory :university_profile do
    name 'Foo University'
    number_of_students 5
    country 'Brazil'
    city 'Cuiaba'
    street 'Foo bar street'
    we_are 'Why we do it'
    why_should_you_study_here 'Why should you join our team'
    special_features 'Special features'
    subject_areas 'Subject Areas foo'
    type_of_university 'public'
    user { create(:user) }

    # after :create do |b|
    #   b.update_column(:picture, '/foo/bar/baz.png')
    # end

    factory :university_profile_with_images do
      transient do
        images_count 2
      end

      # after(:create) do |university_profile, evaluator|
      #   create_list(
      #     university_profile: university_profile
      #   )
      # end
    end
  end

  factory :updated_university_profile, class: UniversityProfile do
    name 'Foo University'
    number_of_students 5
    country 'Brazil'
    city 'Cuiaba'
    street 'Foo bar street'
    we_are 'Why we do it'
    why_should_you_study_here 'Why should you join our team'
    special_features 'Special features'
    subject_areas 'Subject Areas foo'
    type_of_university 'public'
  end
end