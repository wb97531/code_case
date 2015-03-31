class VerificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :get_coder

  def create
    @coder.update_attribute(:phone_verified, true)
    head :ok
  end

  private

  def get_coder
    unless @coder = Coder.find_by_phone(params['From'].chars.pop(10).join)
      head :not_found
    end
  end
end
