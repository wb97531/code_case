# Preview all emails at http://localhost:3000/rails/mailers/coder_verify_notifier
class CoderVerifyNotifierPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/coder_verify_notifier/signed_up
  def signed_up
    CoderVerifyNotifier.signed_up
  end

  # Preview this email at http://localhost:3000/rails/mailers/coder_verify_notifier/verified
  def verified
    CoderVerifyNotifier.verified
  end

  # Preview this email at http://localhost:3000/rails/mailers/coder_verify_notifier/verify
  def verify
    CoderVerifyNotifier.verify
  end
end
