class PhoneVerificationService
  attr_reader :coder

  def initialize(options)
    @coder = Coder.find(options[:coder_id])
  end

  def process
    send_sms
  end

  private

  def from
    # Add your twilio phone number (programmable phone number)
    Settings.twilio_number_for_app
  end

  def to
    # +1 is a country code for USA
    "+1#{coder.phone}"
  end

  def body
    "Please reply with this code '#{coder.phone_verification_code}' to
    verify your phone number"
  end

  def twilio_client
    # Pass your twilio account sid and auth token
    @twilio ||= Twilio::REST::Client.new(Settings.twilio_account_sid,
                                         Settings.twilio_auth_token)
  end

  def send_sms
    Rails.logger.info "SMS: From: #{from} To: #{to} Body: \"#{body}\""

    twilio_client.account.messages.create(
      from: from,
      to: to,
      body: body
    )
  end
end