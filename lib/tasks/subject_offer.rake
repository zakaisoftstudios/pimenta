desc 'Subject Offer Rakes'

namespace :subject_offer do
  task :state_unpublished_if_start_date_expired => :environment do
	  SubjectOffer.where("start_date < ?", DateTime.now).update_all(state: :unpublished)
  end
end
