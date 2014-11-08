class SessionsController < ApplicationController

  def create
    coder = Coder.find_by_email(params[:email])
    if coder && coder.authenticate(params[:password])
      # coder submitted valid password
      session[:coder_id] = coder.id
      redirect_to dashboard_path, notice: "Welcome back #{coder.coder_name}"
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
end
