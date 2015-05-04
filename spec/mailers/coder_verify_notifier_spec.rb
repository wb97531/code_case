require "rails_helper"
RSpec.describe CoderVerifyNotifier, type: :mailer do
  let(:coder) { FactoryGirl.build_stubbed(:coder, token: '1234567890') }
  describe "signed_up" do
    let(:mail) { CoderVerifyNotifier.signed_up(coder) }

    it "renders the headers" do
      expect(mail.subject).to eq("Please verify your e-mail address")
      expect(mail.to).to eq([coder.email])
      expect(mail.from).to eq(["wb9753@gmail.com"])
    end

    xit "renders the body" do
      expect(mail.body.encoded).to match("Hello #{ coder.coder_name.titleize}")
      expect(mail.body.encoded).to match("#{ verify_email_url(coder.token)}")
    end
  end

  describe "verified" do
    let(:mail) { CoderVerifyNotifier.verified(coder) }

    it "renders the headers" do
      expect(mail.subject).to eq("Thank you for verifying your e-mail address")
      expect(mail.to).to eq([coder.email])
      expect(mail.from).to eq(["wb9753@gmail.com"])
    end

    xit "renders the body" do
      expect(mail.body.encoded).to match("Hello #{ coder.coder_name.titleize}")
      expect(mail.body.encoded).to match(verify_email_url(coder.token))
    end
  end

  describe "verify" do
    let(:mail) { CoderVerifyNotifier.verify(coder) }

    it "renders the headers" do
      expect(mail.subject).to eq("Please verify your e-mail address")
      expect(mail.to).to eq([coder.email])
      expect(mail.from).to eq(["wb9753@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello #{coder.coder_name}")
    end
  end
end
