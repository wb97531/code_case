json.array!(@courses) do |course|
  json.extract! course, :id, :title, :completion_date, :certificate, :completed, :coder_id
  json.url course_url(course, format: :json)
end
