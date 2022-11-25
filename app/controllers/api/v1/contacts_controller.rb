module Api
  module V1
    class ContactsController < ApiController
      def create
        contact = Contact.new(contact_params)
        contact.validate!

        ContactMailer.contact_from_site(
          sender_name: contact.sender_name,
          sender_email: contact.sender_email,
          subject: contact.subject,
          message: contact.message
        ).deliver_later

        json({}, :created)
      end

      private

      def contact_params
        params.require(:contact).permit(:sender_name, :sender_email, :subject, :message)
      end
    end
  end
end