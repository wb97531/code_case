class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_coder

  private

  def current_coder
    @coder = Coder.find(session[:coder_id]) if session[:coder_id]
  end
end
