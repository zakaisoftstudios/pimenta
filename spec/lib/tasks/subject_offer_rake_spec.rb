require "rails_helper"
Rails.application.load_tasks
require 'rake'

describe "Subject Offer Rakes" do
  context "run state_unpublished_if_start_date_expired" do
    it "has to be unpublished" do
      subject_offer_1 = create(:subject_offer, start_dates: [DateTime.now - 1.year])
      Rake::Task["subject_offer:state_unpublished_if_start_date_expired"].invoke

      expect(SubjectOffer.find(subject_offer_1.id).unpublished?).to be true
    end

    it "has to be published" do
      subject_offer_2 = create(:subject_offer, start_dates: [DateTime.now + 1.year])
      Rake::Task["subject_offer:state_unpublished_if_start_date_expired"].invoke

      expect(SubjectOffer.find(subject_offer_2.id).published?).to be true
    end
  end
end
