module ProjectsHelper

  def project_names
    Project.where(coder_id: current_coder.id).map(&:project_name)
  end

end
