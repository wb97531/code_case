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
      redirect_to login_path,
                  notice: "#{coder.email} has been logged out."
    end
  end

  def guest
  end

  def view_coder
    Coder.find_by(email: params[:email]) ? coder_id = Coder.find_by(email: params[:email]).id : false
    if coder_id
      redirect_to dashboard_path(coder_id)
    else
      redirect_to guest_path, notice: 'We can\'t locate a coder with that email address.'
    end
  end

end
