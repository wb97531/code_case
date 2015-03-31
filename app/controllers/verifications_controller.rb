class VerificationsController < ApplicationController

  before_filter :get_coder

  def create
    @coder.update_attribute(:phone_verified, true)
    head :ok
  end

  private

  def get_coder
    coder_phone = params['From'].chars.pop(10).join
    unless @coder = Coder.find_by_phone(coder_phone)
      head :not_found
    end
  end
end