class EmailConfirmationMailer < ApplicationMailer
  def email_confirmation_email(user)
    host = Nxt::Util::Http.get_email_host
    @user = user
    @email_confirmation_link = "#{host}/email-confirmation/#{user.confirm_token}"

    mail(
      to: user.email,
      subject: t('emails.confirmation_email.subject')
    )
  end
end