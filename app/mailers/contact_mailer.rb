class ContactMailer < ApplicationMailer

	def contact_from_site(sender_name:, sender_email:, subject:, message:)
		@sender_name = sender_name
		@sender_email = sender_email
		@subject = subject
		@message = message

		mail(
			to: 'office@c2su.de',
			subject: t('emails.contact_email.subject')
		)  
	end
end
