require "rails_helper"

RSpec.describe CoderNotifier, type: :mailer do
  describe "send_coder_email" do
    let(:mail) { CoderNotifier.send_coder_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Send coder email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
