FactoryBot.define do
  base64_image = File.read(Rails.root.join(
    'spec/fixtures/images/base64_image.txt')
  )

  factory :student_profile do
    user { create(:user) }
    name { 'Marcio Gouvea Silva' }
    date_of_birth { 'July 17, 1984' }
    gender { 'm' }
    country { 'Germany' }
    city { 'Frankenberg' }
    postal_code { '09669' }
    latitude { 50.9187702 }
    longitude { 13.0846822437484 }
    street { 'Rua Prof. Tereza Lobo' }
    graduation { 'Computer Science' }
    grade_point_average { 9.5 }
    available_from { 'July 26, 2018' }
    driving_license { '32392032902' }
    mobility { 'no' }
    other_skills_and_interests { "Use float when you don't care about precision too much. For example, some scientific simulations and calculations only need up to 3 or 4 significant digits. This is useful in trading off accuracy for speed. Since they don't need precision as much as speed, they would use float." }
    profile_complete { true }

    factory  :student_profile_with_images do
      transient do
        images_count 2
      end
    end
  end

  factory :updated_student_profile, class: StudentProfile do
    name { 'Marcio Gouvea Silva' }
    date_of_birth { 'July 17, 1984' }
    gender { 'm' }
    country { 'Germany' }
    city { 'Frankenberg' }
    postal_code { '09669' }
    latitude { 50.9187702 }
    longitude { 13.0846822437484 }
    street { 'Rua Prof. Tereza Lobo' }
    graduation { 'Computer Science' }
    grade_point_average { 9.5 }
    available_from { 'July 26, 2018' }
    driving_license { '32392032902' }
    mobility { 'no' }
    other_skills_and_interests { "Use float when you don't care about precision too much. For example, some scientific simulations and calculations only need up to 3 or 4 significant digits. This is useful in trading off accuracy for speed. Since they don't need precision as much as speed, they would use float." }
  end
end
