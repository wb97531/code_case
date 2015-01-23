class DashboardsController < ApplicationController
  def dashboard
    current_coder ? @projects = current_coder.projects : @projects = Coder.find(params[:id]).projects
    current_coder ? @snippets = current_coder.snippets : @snippets = Coder.find(params[:id]).snippets
    current_coder ? @courses  = current_coder.courses.order(:completion_date).reverse :
      @courses  = Coder.find(params[:id]).courses.order(:completion_date).reverse
  end
end

