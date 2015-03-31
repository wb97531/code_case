class SmsTextMessagesController < ApplicationController
  before_action :set_coder, only: [:add_phone, :update_coders_phone]

  def add_phone
  end

  def update_coders_phone
    if @coder.update(phone: params[:phone].chars.keep_if { |char| char =~ /[0123456789]/ }.pop(10).join)

      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_ACCOUNT_TOKEN"])

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: ENV["TWILIO_FROM"],
        to: @coder.phone,
        body: "To verify your number, please reply 'OK' to this message.")
      redirect_to dashboard_path(@coder.id)
    else
      render :add_phone
    end
  end

  private

  def set_coder
    @coder = Coder.find(current_coder.id)
  end
end
