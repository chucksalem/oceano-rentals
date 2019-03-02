class ContactMailer < ApplicationMailer
  def contact(email:, first_name:, last_name:, phone:, message:)
    @email      = email
    @first_name = first_name
    @last_name  = last_name
    @message    = message
    @phone      = phone
    mail(
      from: email,
      subject: 'Contact Form'
    )
  end

  def work_order(email:, owner_name:, property_name:, message:)
    @email      = email
    @owner_name = owner_name
    @property_name = property_name
    @message    = message

    mail(subject: 'Work Order Form')
  end
end
