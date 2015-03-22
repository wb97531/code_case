class DashboardsController < ApplicationController
  def dashboard
    @coder ||= Coder.find(params[:id])
    current_coder ? @projects = current_coder.projects : @projects = @coder.projects
    current_coder ? @snippets = current_coder.snippets : @snippets = @coder.snippets
    current_coder ? @courses = current_coder.courses.order(:completion_date).reverse :
      @courses = @coder.courses.order(:completion_date).reverse
  end

  def email_form
  end

  def send_coder_email
    @email = params[:guest_email]
    @subject = params[:subject]
    @message = params[:message]
    @coder = Coder.find_by(email: session[:coders_email])
    CoderNotifier.send_coder_email(@email, @subject, @message, @coder).deliver
    redirect_to dashboard_path(@coder.id), notice: 'Email has been sent.'
  end
end
