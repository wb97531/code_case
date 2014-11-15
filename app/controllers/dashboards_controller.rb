class DashboardsController < ApplicationController
  def dashboard
    @projects = current_coder.projects
    @snippets = current_coder.snippets
    @courses  = current_coder.courses
  end
end

