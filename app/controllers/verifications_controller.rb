class VerificationsController < ApplicationController

  before_filter :get_coder

  def create
    @coder.update_attribute(:phone_verified, true)
    head :ok
  end

  private

  def get_coder
    unless @coder = Coder.find_by_phone(params['From'])
      head :not_found
    end
  end
end