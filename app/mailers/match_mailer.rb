class MatchMailer < ApplicationMailer
  def new_match(recipient:, matched:)
    @recipient = recipient
    @matched = matched

    mail(to: recipient.email, subject: t('emails.new_match_email.subject'))
  end
  
  def new_hunt(recipient:, hunter:)
    @recipient = recipient
    @hunter = hunter

    mail(to: recipient.email, subject: t('emails.new_hunt_email.subject'))
  end

  def weekly_likes_report(recipient:, likes:)
    @recipient = recipient
    @likes_count = likes.size
    
    mail(
      to: recipient.email, 
      subject: t('emails.weekly_likes_report_email.subject')
    )
  end
end