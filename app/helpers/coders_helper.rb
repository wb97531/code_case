module CodersHelper
  def profile_image_for(coder)
    url = "https://secure.gravatar.com/avatar/#{coder.gravatar_id}"
    image_tag(url, alt: coder.coder_name)
  end
end
