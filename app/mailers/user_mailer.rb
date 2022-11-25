class UserMailer < ApplicationMailer

  def password_reset(user)
    host = Nxt::Util::Http.get_email_host
    @user 										= user 
    @password_reset_url 			= "#{host}/password-reset/#{@user.password_reset_token}"

    mail to: user.email, subject: t('emails.password_reset_email.subject')
  end

  def password_updated(user)
  	@user = user 

    mail to: user.email, subject: t('emails.password_updated_email.subject')
  end
end
