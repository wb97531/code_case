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
  end

  def send_coder_email
    @coder = Coder.find_by(email: session[:coders_email])
    if under_email_limit?
      @email = params[:guest_email]
      @subject = params[:subject]
      @message = params[:message]
      CoderNotifier.send_coder_email(@email, @subject, @message, @coder).deliver
      redirect_to dashboard_path(@coder.id), notice: 'Email has been sent.'
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
end
