require "rails_helper"

RSpec.describe CoderNotifier, type: :mailer do
  describe "the guest can send the coder an email" do
    let(:email_subject) { "Send coder email" }
    let(:message) { "I like what I see let's connect!" }
    let(:coder) { FactoryGirl.create(:coder) }
    let(:mail) { CoderNotifier.send_coder_email(coder.email, email_subject, message, coder) }

    it "renders the headers" do
      expect(mail.subject).to eq("Send coder email")
      expect(mail.to).to eq([coder.email])
      expect(mail.from).to eq(['wb9753@gmail.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(message)
    end
  end
end
