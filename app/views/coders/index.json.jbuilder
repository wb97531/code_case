json.array!(@coders) do |coder|
  json.extract! coder, :id, :coder_name, :password_digest, :email
  json.url coder_url(coder, format: :json)
end
