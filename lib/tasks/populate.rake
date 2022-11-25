desc 'Update qualities'

namespace :populate do
  task :start_dates => :environment do
    ActiveRecord::Base.transaction do
      SubjectOffer.all.each do |subject_offer|
        subject_offer.update(start_dates: [subject_offer.start_date]) unless subject_offer.start_dates.present?
      end
    end
  end
end
