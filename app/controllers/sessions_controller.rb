class SessionsController < ApplicationController
  def login
  end

  def create
    coder = Coder.find_by_email(params[:email])
    if coder && coder.authenticate(params[:password])
      # coder submitted valid password
      session[:coder_id] = coder.id
      redirect_to dashboard_path(coder.id), notice: "Welcome back #{coder.coder_name}"
    else
      flash[:error] = "Oops, something went wrong. Try again."
      render :login
    end
  end

  def destroy
    if coder = current_coder
      session[:coder_id] = nil
      session[:coders_email] = nil
      redirect_to login_path,
                  notice: "#{coder.email} has been logged out."
    else
      session[:coders_email] = nil
      redirect_to login_path
    end
  end

  def guest
  end

  def view_coder
    if Coder.find_by(email: params[:email])
      @coder = Coder.find_by(email: params[:email])
    elsif session[:coders_email]
      @coder = Coder.find_by(email: session[:coders_email])
    else
      @coder = nil
    end
    if @coder
      session[:coders_email] = @coder.email
      redirect_to dashboard_path(@coder.id)
    else
      redirect_to guest_path, notice: 'We can\'t locate a coder with that email address.'
    end
  end
end
