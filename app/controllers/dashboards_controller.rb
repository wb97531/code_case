class DashboardsController < ApplicationController
  def dashboard
    @coder ||= Coder.find(params[:id])
    session[:coders_email] = @coder.email
    current_coder ? @projects = current_coder.projects : @projects = @coder.projects
    current_coder ? @snippets = current_coder.snippets : @snippets = @coder.snippets
    current_coder ? @courses = current_coder.courses.order(:completion_date).reverse :
      @courses = @coder.courses.order(:completion_date).reverse
  end

  def email_form
    @coder = current_coder || Coder.find_by(email: session[:coders_email])
  end

  def send_coder_email
    @coder = Coder.find_by(email: session[:coders_email])
    if under_email_limit?
      @email = params[:guest_email]
      @subject = params[:subject]
      @message = params[:message]
      CoderNotifier.send_coder_email(@email, @subject, @message, @coder).deliver
      # if @coder.phone && under_text_limit?
        send_text_to_coder(@coder.phone)
      # else
        redirect_to root_path, notice: 'Email has been sent'
      # end
    else
      redirect_to dashboard_path(@coder.id), notice: 'Email limit is 5.'
    end
  end

  private

  def under_email_limit?
    session[:email_count] ||= 0
    session[:email_count] += 1
    session[:email_count] <= 5
  end

  def under_text_limit?
    session[:text_count] ||= 0
    session[:text_count] += 1
    session[:text_count] <= 2
  end

  def send_text_to_coder(coder_phone_number)
    client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_ACCOUNT_TOKEN"])

    # Create and send an SMS message
    client.account.sms.messages.create(
      from: ENV["TWILIO_FROM"],
      to: coder_phone_number,
      body: "Check your email. There has been interest from Code Case"
    )
    ###### redirect to dashboard path
    redirect_to root_path, notice: 'An email and text has been sent to developer'
  end
end
