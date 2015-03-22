FactoryGirl.define do
  factory :snippet do
    objective "World peace"
    image_name "awesome_pic"
    github_file_link "https://github.com"
    project_id 1000
    coder_id 1000
  end
end
