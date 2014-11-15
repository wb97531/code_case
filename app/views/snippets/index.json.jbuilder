json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :objective, :image_name, :github_file_link, :project_id
  json.url snippet_url(snippet, format: :json)
end
