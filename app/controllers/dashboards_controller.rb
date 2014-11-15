class DashboardsController < ApplicationController
  def dashboard
    coder = Coder.find(current_coder.id)
    @projects = coder.projects
    @snippets = coder.snippets
    @courses  = coder.courses
  end
end

