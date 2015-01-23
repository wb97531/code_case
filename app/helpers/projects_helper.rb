module ProjectsHelper
  def project_names
    Project.where(coder_id: session[:coder_id]).map do |project|
      project.project_name
    end
  end
end
