json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :github_link, :deadline, :description, :priority, :coder_id, :current
  json.url project_url(project, format: :json)
end
