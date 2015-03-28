class TextMessagesController < ApplicationController
  before_action :set_coder, only: [:add_phone, :update_coders_phone]

  def add_phone
  end

  def update_coders_phone
    respond_to do |format|
      if @coder.update(phone: params[:phone])
        format.html { redirect_to @coder, notice: "#{@coder.coder_name} phone was successfully added." }
      else
        format.html { render :add_phone }
      end
    end
  end

  private

  def set_coder
    @coder = Coder.find(current_coder.id)
  end
end
