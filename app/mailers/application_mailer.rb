# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@oceano-rentals.com'
  default to: 'info@gooceano.com'

  layout 'mailer'
end
