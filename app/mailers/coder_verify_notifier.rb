class CoderVerifyNotifier < ActionMailer::Base
  default from: "wb9753@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coder_verify_notifier.signed_up.subject
  #
  def signed_up(coder)
    @coder = coder
    mail to: @coder.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coder_verify_notifier.verified.subject
  #
  def verified(coder)
    @coder = coder
    mail to: @coder.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coder_verify_notifier.verify.subject
  #
  def verify(coder)
    @coder = coder
    mail to: @coder.email
  end
end
