class ApplicationMailer < ActionMailer::Base
  default from: %( "TestGuru" <guru@mail.com> )
  layout 'mailer'
end
