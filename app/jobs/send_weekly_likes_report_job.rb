class SendWeeklyLikesReportJob < ApplicationJob
  queue_as :default

  def perform
    p "SendWeeklyLikesReportJob sending"

    CompanyProfile.all.each do |company|
      likes = Like.for_company(company).from_last_week
      
      MatchMailer.weekly_likes_report(
        recipient: company.user, 
        likes: likes
      ).deliver_now if likes.any?
    end
  end
end