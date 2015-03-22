# Preview all emails at http://localhost:3000/rails/mailers/coder_notifier
class CoderNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/coder_notifier/send_coder_email
  def send_coder_email
    CoderNotifier.send_coder_email
  end

end
