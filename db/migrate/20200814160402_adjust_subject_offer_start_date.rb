class AdjustSubjectOfferStartDate < ActiveRecord::Migration[5.0]
  def change
    university_profile = UniversityProfile.find_by_name('Masterclass by c2su')
    if university_profile.present?
      subject_offers = university_profile.subject_offers
      subject_offers.map do |subject_offer|
        start_dates = subject_offer.start_dates.map do |start_date|
          if start_date == ''
            DateTime.now + 1.week
          else
            start_date
          end
        end
        subject_offer.update(start_dates: start_dates)
      end
    end
  end
end
