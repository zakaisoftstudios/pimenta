JobOfferSkill.destroy_all
JobOfferInterest.destroy_all
JobOfferStrength.destroy_all
Hunt.destroy_all
Like.destroy_all
JobOffer.destroy_all
AdminProfile.destroy_all
CompanyProfile.destroy_all
StudentProfile.destroy_all
UniversityProfile.destroy_all
Certificate.destroy_all
Skill.destroy_all
Strength.destroy_all
Interest.destroy_all
ConversationMessage.destroy_all
Conversation.destroy_all
User.destroy_all

[ 
  { label: 'Maths', value: 'maths' },
  { label: 'Physics', value: 'physics' },
  { label: 'Geography', value: 'geography' },
  { label: 'History', value: 'history' },
  { label: 'Music', value: 'music' },
  { label: 'Art', value: 'art' },
  { label: 'Spanisch', value: 'spanisch' },
  { label: 'Religion', value: 'religion' },
  { label: 'Sports', value: 'sports' },
  { label: 'Deutsch', value: 'deutsch' },
  { label: 'Literatur', value: 'literatur' },
  { label: 'Literatur', value: 'chemie' },
  { label: 'Biologie', value: 'biologie' },
  { label: 'Social', value: 'social' },
  { label: 'Politk', value: 'politics' },
  { label: 'Englisch', value: 'englisch' },
  { label: 'Franzosich', value: 'franzosich' },
  { label: 'Latein', value: 'latein' },
  { label: 'Philosophie', value: 'philosophie' },
  { label: 'Informatik', value: 'informatik' },
  { label: 'Wirtschaft', value: 'wirtschaft' }
].each do |skill|
  Skill.create!(label: skill[:label], value: skill[:value])
end

[ 
  { label: 'Medicine', value: 'medicine' },
  { label: 'Office', value: 'office' },
  { label: 'IT', value: 'it' },
  { label: 'Trends', value: 'trends' },
  { label: 'Technology', value: 'technology' },
  { label: 'Automotive', value: 'automotive' },
  { label: 'Mobility', value: 'mobility' },
  { label: 'Media', value: 'media' },
  { label: 'Marketing', value: 'marketing' },
  { label: 'Sales', value: 'sales' },
  { label: 'Industry', value: 'industry' },
  { label: 'Electrical Engineering', value: 'electricalEngineering' },
  { label: 'Consultation', value: 'consultation' },
  { label: 'Money', value: 'money' },
  { label: 'Law', value: 'law' },
  { label: 'Research', value: 'research' },
  { label: 'Logistics', value: 'logistics' },
  { label: 'Architecture', value: 'architecture' },
  { label: 'Foods', value: 'foods' },
  { label: 'Art', value: 'art' },
  { label: 'Development', value: 'development' },
  { label: 'Service', value: 'service' },
  { label: 'Health', value: 'health' },
  { label: 'Metal', value: 'metal' },
  { label: 'Sports', value: 'sports' },
  { label: 'Books', value: 'book' },
  { label: 'Mechanics', value: 'mechanics' },
  { label: 'Cars', value: 'cars' }
].each do |skill|
  Interest.create!(label: skill[:label], value: skill[:value])
end

[ 
  { label: 'Fit', value: 'fit' },
  { label: 'Friendly', value: 'friendly' },
  { label: 'Cleverly', value: 'cleverly' },
  { label: 'Technically Gifted', value: 'technicallyGifted' },
  { label: 'Sociable', value: 'sociable' },
  { label: 'Team Player', value: 'teamPlayer' },
  { label: 'Courage', value: 'courage' },
  { label: 'Security considered', value: 'securityConsidered' },
  { label: 'Creative', value: 'creative' },
  { label: 'Formative', value: 'formative' },
  { label: 'Combinatorikal', value: 'combinatorikal' },
  { label: 'Structured', value: 'structured' },
  { label: 'Visually', value: 'visually' },
  { label: 'Risk taker', value: 'riskTaker' },
  { label: 'Techinically affine', value: 'techicallyAffine' },
  { label: 'Stress resistant', value: 'stressResistant' },
  { label: 'Deescalating', value: 'deescalating' },
  { label: 'Patiently', value: 'patiently' },
  { label: 'Honestly', value: 'honestly' },
  { label: 'Organizational', value: 'organizational' },
  { label: 'Emphatic', value: 'emphatic' }
].each do |strenght|
  Strength.create!(label: strenght[:label], value: strenght[:value])
end

5.times do |i|
  admin_user   = User.create!(
    email: "admin#{i}@email.com",  
    password: 'foobar', 
    confirm_token: 'foobar',
    email_confirmed: true
  )

  company_user   = User.create!(
    email: "company#{i}@email.com",
    password: 'foobar', 
    confirm_token: 'foobar',
    email_confirmed: true
  )

  university_user   = User.create!(
    email: "university#{i}@email.com",  
    password: 'foobar', 
    confirm_token: 'foobar',
    email_confirmed: true
  )

  company_user_2 = User.create!(
    email: "company2#{i}@email.com", 
    password: 'foobar', 
    confirm_token: 'foobar', 
    email_confirmed: true
  )

  student_user_1 = User.create!(
    email: "student1#{i}@email.com", 
    password: 'foobar', 
    confirm_token: 'foobar',
    email_confirmed: true
  )
  student_user_2 = User.create!(
    email: "student2#{i}@email.com", 
    password: 'foobar', 
    confirm_token: 'foobar',
    email_confirmed: true
  )

  admin_profile = AdminProfile.create!(
    user: admin_user,
    name: 'Glauton'
  )

  company_profile = CompanyProfile.create!(
    user: company_user, 
    attachments: [
      Attachment.create!(
        picture: nil,
        purpose: :avatar
      ),
      Attachment.create!(
        picture: nil,
        purpose: :cover
      ),
      Attachment.create!(
        picture: nil,
        purpose: :about
      ),
      Attachment.create!(
        picture: nil,
        purpose: :video
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      )
    ],
    name: 'IT Consultancy',
    contact_person: 'Marcio Gouvea',
    industry_sector: 'IT Industry',
    number_of_employees: 50,
    country: 'Germany',
    city: 'Berlin',
    postal_code: '10117',
    latitude: 52.5227915,
    longitude: 13.3914374,
    street: 'Foo bar street',
    what_we_do: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    why_we_do_it: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    why_you_should_join_our_team: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    special_features: 'Coffee. Soft beer.',
    home_page: 'http://website.com'
  )

  company_profile_2 = CompanyProfile.create!(
    user: company_user_2, 
    attachments: [
      Attachment.create!(
        picture: nil,
        purpose: :avatar
      ),
      Attachment.create!(
        picture: nil,
        purpose: :cover
      ),
      Attachment.create!(
        picture: nil,
        purpose: :about
      ),
      Attachment.create!(
        picture: nil,
        purpose: :video
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      )
    ],
    name: 'University of Berlin',
    contact_person: 'Joshua Tree',
    industry_sector: 'Education',
    number_of_employees: 550,
    country: 'Germany',
    city: 'Berlin',
    postal_code: '10117',
    latitude: 52.5227915,
    longitude: 13.3914374,
    street: 'Foo bar street',
    what_we_do: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    why_we_do_it: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    why_you_should_join_our_team: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    special_features: 'Coffee. Soft beer.'
  )

  university_profile = UniversityProfile.create!(
    user: university_user, 
    attachments: [
      Attachment.create!(
        picture: nil,
        purpose: :avatar
      ),
      Attachment.create!(
        picture: nil,
        purpose: :cover
      ),
      Attachment.create!(
        picture: nil,
        purpose: :about
      ),
      Attachment.create!(
        picture: nil,
        purpose: :video
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      )
    ],
    name: 'Harward',
    type_of_university: :private,
    number_of_students: 567,
    we_are: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    why_should_you_study_here: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    subject_areas: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    special_features: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum interdum dui, non sagittis nisl euismod eget.',
    country: 'Germany',
    city: 'Berlin',
    postal_code: '10117',
    latitude: 52.5227915,
    longitude: 13.3914374,
    street: 'Foo bar street',
    home_page: 'http://google.com',
    youtube_link: 'http://youtube.com',
    facebok_link: 'http://facebook.com',
    twitter_link: 'http://twitter.com',
    contact_email: "gouvermxt#{i}@gmail.com"
  )

  [company_profile, company_profile_2, university_profile].each do |profile|
    Link.kinds.each do |key, value|
      profile.links.create({
        url: "http://mywebsite.com/#{key}",
        kind: key
      })
    end  
  end  

  student_profile_1 = StudentProfile.create!(
    user: student_user_1,
    name: 'Marcio Gouvea Silva',
    date_of_birth: 'July 17, 1984',
    gender: 'm',
    country: 'Germany',
    city: 'Frankenberg',
    postal_code: '09669',
    latitude: 50.9187702,
    longitude: 13.0846822437484,
    street: 'Rua Prof. Tereza Lobo',
    graduation: 'Computer Science',
    grade_point_average: 9.5,
    available_from: 'July 26, 2018',
    driving_license: '32392032902',
    mobility: 'no',
    other_skills_and_interests: "Use float when you don't care about precision too much. For example, some scientific simulations and calculations only need up to 3 or 4 significant digits. This is useful in trading off accuracy for speed. Since they don't need precision as much as speed, they would use float.",
    attachments: [
      Attachment.create!(
        picture: nil,
        purpose: :avatar
      ),
      Attachment.create!(
        picture: nil,
        purpose: :cover
      ),
      Attachment.create!(
        picture: nil,
        purpose: :about
      ),
      Attachment.create!(
        picture: nil,
        purpose: :video
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      )
    ]
  )

  student_profile_2 = StudentProfile.create!(
    user: student_user_2,
    name: 'Jessica Parker',
    date_of_birth: 'Dec 1, 2001',
    gender: 'f',
    country: 'Germany',
    city: 'Bad Elster',
    postal_code: '08645',
    latitude: 50.28282795,
    longitude: 12.2400446941576,
    street: 'Rua Street',
    graduation: 'Physics',
    grade_point_average: 8.3,
    available_from: 'Jan 15, 2019',
    driving_license: '28438949303',
    mobility: 'yes',
    other_skills_and_interests: "Use float when you don't care about precision too much. For example, some scientific simulations and calculations only need up to 3 or 4 significant digits. This is useful in trading off accuracy for speed. Since they don't need precision as much as speed, they would use float.",
    attachments: [
      Attachment.create!(
        picture: nil,
        purpose: :avatar
      ),
      Attachment.create!(
        picture: nil,
        purpose: :cover
      ),
      Attachment.create!(
        picture: nil,
        purpose: :about
      ),
      Attachment.create!(
        picture: nil,
        purpose: :video
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      ),
      Attachment.create!(
        picture: nil,
        purpose: :regular
      )
    ]
  )


  2.times { |i|
    student_profile_1.certificates.create!(
      pdf: Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'db', 'samples', 'document.pdf')
      ),
      title: "Certificate #{i}"
    )
  }

  [student_profile_1, student_profile_2].each do |student_profile|
    5.times { |n|
      student_profile.student_profile_skills << StudentProfileSkill.new(
        skill: Skill.all[n]
      )
    }
    
    5.times { |n|
      student_profile.student_profile_interests.create!(
        interest: Interest.all[n]
      )
    }
    
    5.times { |n|
      student_profile.student_profile_strengths.create!(
        strength: Strength.all[n]
      )
    }
  end

  student_profile_1.education_entries.create!(
    from: 'July 10, 2007',
    to: 'July 12, 2012',
    school_name: 'ERPAF',
    city: 'Alta Floresta/MT',
    country: 'Brazil',
    grade_point_average: 8.9,
    educational_level: :hauptschulabschluss
  )

  student_profile_1.education_entries.create!(
    from: 'April 02, 2017',
    to: 'April 30, 2018',
    school_name: 'Udacity',
    city: 'Cuiabá/MT',
    country: 'Brazil',
    grade_point_average: 8.9,
    educational_level: :mittlere_reife
  )

  student_profile_1.work_experiences.create!(
    from: 'April 30, 2017',
    to: 'June 30, 2018',
    title: 'Software Engineer',
    kind: :full_time_job,
    company_name: 'Pimenta Group',
    department: 'Recruitment',
    city: 'Munster',
    country: 'Germany',
    tasks: "Use float when you don't care about precision too much. For example, some scientific simulations and calculations only need up to 3 or 4 significant digits."
  )

  student_profile_1.work_experiences.create!(
    from: 'July 01, 2017',
    to: 'August 30, 2018',
    title: 'Salesperson',
    kind: :aprrencticeship,
    company_name: 'Foo Bar Company',
    department: 'Sales',
    city: 'Cuiaba',
    country: 'Brazil'
  )

  4.times do
    subject_offer_1 = university_profile.subject_offers.create!(
      name: "Test Class #{rand(1..100)}",
      type_of_degree:"certificate",
      content:"content",
      perspectives:"perspectives",
      tests:"tests",
      postal_code:"postal_code",
      country:"Vereinigte Arabische Emirate",
      city:"Al Muteena",
      street:"123",
      latitude: 25.2713704831557,
      longitude: 55.3166502417433,
      start_dates: [DateTime.now + 1.year, DateTime.now + 1.month, DateTime.now],
      duration_in_hours: 12,
      cost_period: "hourly",
      cost_amount: 12.0,
      hours_of_classes_per_week: 12,
      number_of_places: 12,
      minimum_degree: "bachelor",
      state: "published",
      university_profile_id: 25, 
      nummerus_clausus: 12.0,
      web_site_link: "https://c2su.de",
      subject_offer_skills: [
        SubjectOfferSkill.new(skill: Skill.all[0], must_have: true),
        SubjectOfferSkill.new(skill: Skill.all[1])
      ],
      subject_offer_interests: [
        SubjectOfferInterest.new(interest: Interest.all[0], must_have: true),
        SubjectOfferInterest.new(interest: Interest.all[1])
      ],
      subject_offer_strengths: [
        SubjectOfferStrength.new(strength: Strength.all[0], must_have: true),
        SubjectOfferStrength.new(strength: Strength.all[1])
      ],
      attachments: [
        Attachment.create!(picture: nil, purpose: :main),
        Attachment.create!(picture: nil, purpose: :regular),
        Attachment.create!(picture: nil, purpose: :regular),
        Attachment.create!(video: nil, purpose: :regular),
        Attachment.create!(purpose: :video)
      ]
    )
  end

  job_offer_2 = company_profile_2.job_offers.create!(
    attachments: [
      Attachment.create!(picture: nil, purpose: :main),
      Attachment.create!(picture: nil, purpose: :regular),
      Attachment.create!(picture: nil, purpose: :regular),
      Attachment.create!(video: nil, purpose: :regular),
      Attachment.create!(purpose: :video),
    ],
    category: :trainee,
    content: Faker::Lorem.paragraph(2),
    what_is_expected_from_you: Faker::Lorem.paragraph(2),
    what_is_expected_from_us: Faker::Lorem.paragraph(2),
    tasks: Faker::Lorem.paragraph(2),
    perspectives: Faker::Lorem.paragraph(3),
    city: 'Aub',
    country: 'Germany',
    start: Date.tomorrow + 1.day,
    end_date: Date.tomorrow + 30.days,
    street: 'Street',
    wage: 600.57,
    free_places: 2,
    job_offer_skills: [
      JobOfferSkill.new(skill: Skill.all[2], must_have: true),
      JobOfferSkill.new(skill: Skill.all[3])
    ],
    job_offer_interests: [
      JobOfferInterest.new(interest: Interest.all[2], must_have: true),
      JobOfferInterest.new(interest: Interest.all[3])
    ],
    job_offer_strengths: [
      JobOfferStrength.new(strength: Strength.all[2], must_have: true),
      JobOfferStrength.new(strength: Strength.all[3])
    ],
    postal_code: '97239',
    latitude: 49.5452741,
    longitude: 10.0378208440337,
    wage_period: 'weekly',
    minimum_degree: 'bachelor'
  )

  [:given, :regreted, :company_liked_back, :company_rejected].each do |like_state|
    2.times.each do 
      Like.create({
        student_profile:  StudentProfile.find(StudentProfile.pluck(:id).sample),
        job_offer:        JobOffer.find(JobOffer.pluck(:id).sample),
        state:            like_state
      })
    end  
  end
end
