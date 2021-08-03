class ApplicationMailer < ActionMailer::Base
  helper :settings
  helper :application
  default from: 'test'
  layout "mailer"
end
