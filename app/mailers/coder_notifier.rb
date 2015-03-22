class CoderNotifier < ActionMailer::Base
  default from: "wb9753@gmail.com"

  def send_coder_email(email, subject, message, coder)
    @message = message
    @email = email
    mail to: coder.email, subject: subject
  end
end
