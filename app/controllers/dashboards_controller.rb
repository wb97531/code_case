class DashboardsController < ApplicationController
  def dashboard
    @coder = Coder.find(params[:id])
    current_coder ? @projects = current_coder.projects : @projects = @coder.projects
    current_coder ? @snippets = current_coder.snippets : @snippets = @coder.snippets
    current_coder ? @courses  = current_coder.courses.order(:completion_date).reverse :
      @courses  = @coder.courses.order(:completion_date).reverse
  end
end

